package adminowner.admin.model.dao;

import static common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import adminowner.admin.model.vo.Notice;
import member.model.dao.MemberDao;
import member.model.vo.Member;

public class AdminDao {
	private Properties prop = new Properties();

	public AdminDao() {
		String fileName = MemberDao.class.getResource("/sql/admin/admin-query.properties").getPath();

		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	public ArrayList<Member> searchMember(Connection conn) {
		ArrayList<Member> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("searchMember");
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();

			while (rset.next()) {
				list.add(new Member(rset.getInt(1), rset.getString(2), rset.getString(3), rset.getString(4),
						rset.getString(5), rset.getString(6), rset.getInt(7), rset.getInt(8), rset.getString(9),
						rset.getString(10), rset.getDate(11), rset.getDate(12), rset.getInt(13)));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}

	/**
	 * 공지사항 리스트
	 * 
	 * @param conn
	 * @return
	 */
	public ArrayList<Notice> selectNList(Connection conn) {
		ArrayList<Notice> nList = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectNoticeList");
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			while (rset.next()) {
				nList.add(new Notice(rset.getInt(1), rset.getString(2), rset.getString(3),rset.getDate(4),
						rset.getDate(5), rset.getString(6)));
			};

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return nList;
	}
	public int insertNotice(Connection conn, Notice n) {
		int result =0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertNotice");
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, n.getnTitle());
			pstmt.setString(2, n.getnContent());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
	public Notice selectNotice(Connection conn, int nNum) {
		Notice n = new Notice();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectNotice");
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, nNum);
			
			rset=pstmt.executeQuery();
			while(rset.next()) {
				n.setnNum(rset.getInt(1));
				n.setnTitle(rset.getString(2));
				n.setnContent(rset.getString(3));
				n.setnDate(rset.getDate(4));
				n.setnModifyDate(rset.getDate(5));
				n.setnStatus(rset.getString(6));
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return n;
	}
	public int updateNotice(Connection conn, Notice n) {
		int result =0;
		PreparedStatement pstmt= null;
		String sql=prop.getProperty("updateNotice");
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, n.getnTitle());
			pstmt.setString(2, n.getnContent());
			pstmt.setInt(3, n.getnNum());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
	public int deleteNotice(Connection conn, int nNum) {
		int result =0;
		PreparedStatement pstmt= null;
		String sql = prop.getProperty("deleteNotice");
		try {
			pstmt= conn.prepareStatement(sql);
			pstmt.setInt(1, nNum);
			result=pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	
	}

}
