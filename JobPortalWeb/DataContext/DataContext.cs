using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Xml.Linq;

namespace JobPortalWeb.DataContext
{
    public static class DataContext
    {
        public static string ConnectionString = "Data Source=localhost;Initial Catalog=JobPortal;Integrated Security=True;";
        public static SqlConnection cnn;
        public static void OpenConnection()
        {
            cnn = new SqlConnection(ConnectionString);
            cnn.Open();
        }
        public static void CloseConnection()
        {
            cnn.Close();
        }
        public static bool AddInterviewSteps(string name)
        {
            try
            {
                OpenConnection();
                SqlCommand cmd = new SqlCommand("InsertSteps", cnn);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Name", name);
                cmd.Parameters.AddWithValue("@createdBy", "Admin");
                cmd.Parameters.AddWithValue("@modifiedBy", "Admin");
                var result = cmd.ExecuteNonQuery();
                if (result == -1)
                {
                    return false;
                }
                else
                    return true;
            }
            catch (Exception ex)
            {
                return false;
            }
        }

        public static bool updateInterviewSteps(string name, int id)
        {
            try
            {
                OpenConnection();
                var str = "UPDATE InterviewSteps  SET Name = '" + name + "' Where Id = " + id + "";
                SqlCommand cmd = new SqlCommand(str, cnn);
                cmd.CommandType = System.Data.CommandType.Text;
                var result = cmd.ExecuteNonQuery();
                if (result == -1)
                {
                    return false;
                }
                else
                    return true;
            }
            catch (Exception ex)
            {
                return false;
            }
        }

        public static DataTable GetInterviewSteps()
        {
            try
            {
                OpenConnection();
                string query = "Select Id,Name from InterviewSteps";
                DataTable dt = new DataTable();
                SqlCommand cmd = new SqlCommand(query, cnn);
                SqlDataAdapter sqlDataAdapter = new SqlDataAdapter(cmd);
                sqlDataAdapter.Fill(dt);
                CloseConnection();
                return dt;
            }
            catch (Exception)
            {
                return null;

            }

        }

        public static bool AddNewPostion(string name, string description, string ids)
        {
            try
            {
                OpenConnection();
                SqlCommand cmd = new SqlCommand("InsertPosition", cnn);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Name", name);
                cmd.Parameters.AddWithValue("@Description", description);
                cmd.Parameters.AddWithValue("@IsActive", true);
                cmd.Parameters.AddWithValue("@InterviewStepIds", ids);
                cmd.Parameters.AddWithValue("@modifiedBy", "Admin");
                cmd.Parameters.AddWithValue("@createdBy", "Admin");
                var result = cmd.ExecuteNonQuery();
                if (result == -1)
                {
                    return false;
                }
                else
                    return true;
            }
            catch (Exception ex)
            {
                return false;
            }
        }

        public static bool UpdatePostion(int id, string name, string description, bool isActive, string ids)
        {
            try
            {
                OpenConnection();
                SqlCommand cmd = new SqlCommand("UpdatePosition", cnn);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Id", id);
                cmd.Parameters.AddWithValue("@Name", name);
                cmd.Parameters.AddWithValue("@Description", description);
                cmd.Parameters.AddWithValue("@IsActive", isActive);
                cmd.Parameters.AddWithValue("@InterviewStepIds", ids);
                cmd.Parameters.AddWithValue("@createdBy", "Admin");
                cmd.Parameters.AddWithValue("@modifiedBy", "Admin");
                var result = cmd.ExecuteNonQuery();
                if (result == -1)
                {
                    return false;
                }
                else
                    return true;
            }
            catch (Exception ex)
            {
                return false;
            }
        }
        public static DataTable GetPostionDetails()
        {
            try
            {
                OpenConnection();
                string query = "Select Id,Name,Descriptions,Is_Active,InterviewStepIds from Position";
                DataTable dt = new DataTable();
                SqlCommand cmd = new SqlCommand(query, cnn);
                SqlDataAdapter sqlDataAdapter = new SqlDataAdapter(cmd);
                sqlDataAdapter.Fill(dt);
                CloseConnection();
                return dt;
            }
            catch (Exception)
            {
                return null;

            }

        }

        public static bool DeletePosition(int Id)
        {
            try
            {
                OpenConnection();
                string query = "delete from Position where id=" + Id + "";
                SqlCommand cmd = new SqlCommand(query, cnn);
                var result = cmd.ExecuteNonQuery();
                CloseConnection();
                if (result != -1)
                { return true; }
                else { return false; }
            }
            catch (Exception)
            {
                return false;

            }

        }

        public static bool DeleteSteps(int Id)
        {
            try
            {
                OpenConnection();
                string query = "delete from InterviewSteps where id=" + Id + "";
                SqlCommand cmd = new SqlCommand(query, cnn);
                var result = cmd.ExecuteNonQuery();
                CloseConnection();
                if (result != -1)
                { return true; }
                else { return false; }
            }
            catch (Exception)
            {
                return false;

            }

        }

        public static bool AddCadidate(string fullname, string ContactNo, string EmailId, bool IsInternal, string Resume, string PrimarySkill, int AssginedPostion, int YearsOfExperice)
        {
            try
            {
                OpenConnection();
                SqlCommand cmd = new SqlCommand("InsertCandidate", cnn);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@fullname", fullname);
                cmd.Parameters.AddWithValue("@ContactNo", ContactNo);
                cmd.Parameters.AddWithValue("@EmailId", EmailId);
                cmd.Parameters.AddWithValue("@IsInternal", IsInternal);
                cmd.Parameters.AddWithValue("@Resume", Resume);
                cmd.Parameters.AddWithValue("@PrimarySkill", PrimarySkill);
                cmd.Parameters.AddWithValue("@AssginedPostion", AssginedPostion);
                cmd.Parameters.AddWithValue("@YearsOfExperice", YearsOfExperice);
                cmd.Parameters.AddWithValue("@createdBy", "Admin");
                cmd.Parameters.AddWithValue("@modifiedBy", "Admin");
                var result = cmd.ExecuteNonQuery();
                if (result == -1)
                {
                    return false;
                }
                else
                    return true;
            }
            catch (Exception ex)
            {
                return false;
            }
        }

        public static bool UpdateCandidate(int Id, string fullname, string ContactNo, string EmailId, bool IsInternal, string Resume, string PrimarySkill, int AssginedPostion, int YearsOfExperice)
        {
            try
            {
                OpenConnection();
                SqlCommand cmd = new SqlCommand("UpdateCandidate", cnn);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Id", Id);
                cmd.Parameters.AddWithValue("@fullname", fullname);
                cmd.Parameters.AddWithValue("@ContactNo", ContactNo);
                cmd.Parameters.AddWithValue("@EmailId", EmailId);
                cmd.Parameters.AddWithValue("@IsInternal", IsInternal);
                cmd.Parameters.AddWithValue("@Resume", Resume);
                cmd.Parameters.AddWithValue("@PrimarySkill", PrimarySkill);
                cmd.Parameters.AddWithValue("@AssginedPostion", AssginedPostion);
                cmd.Parameters.AddWithValue("@YearsOfExperice", YearsOfExperice);
                cmd.Parameters.AddWithValue("@ModifyedBy", "Admin");
                var result = cmd.ExecuteNonQuery();
                if (result == -1)
                {
                    return false;
                }
                else
                    return true;
            }
            catch (Exception ex)
            {
                return false;
            }
        }

        public static DataTable GetCandidateDetails()
        {
            try
            {
                OpenConnection();
                string query = "Select Id,FullName,ContactNo,EmailId,IsInternal,Resume,PrimarySkill,AssginedPostion,YearsOfExperice from CandidateRegistration";
                DataTable dt = new DataTable();
                SqlCommand cmd = new SqlCommand(query, cnn);
                SqlDataAdapter sqlDataAdapter = new SqlDataAdapter(cmd);
                sqlDataAdapter.Fill(dt);
                CloseConnection();
                return dt;
            }
            catch (Exception)
            {
                return null;

            }

        }

        public static DataTable GetCandidateStatusDetails()
        {
            try
            {
                OpenConnection();
                string query = "Select Id, CandidateName,PositionName,Status from CandidateStatus";
                DataTable dt = new DataTable();
                SqlCommand cmd = new SqlCommand(query, cnn);
                SqlDataAdapter sqlDataAdapter = new SqlDataAdapter(cmd);
                sqlDataAdapter.Fill(dt);
                CloseConnection();
                return dt;
            }
            catch (Exception)
            {
                return null;

            }

        }


        public static bool DeleteCandidate(int Id)
        {
            try
            {
                OpenConnection();
                string query = "delete from CandidateRegistration where Id=" + Id + "";
                SqlCommand cmd = new SqlCommand(query, cnn);
                var result = cmd.ExecuteNonQuery();
                CloseConnection();
                if (result != -1)
                { return true; }
                else { return false; }
            }
            catch (Exception)
            {
                return false;

            }

        }

        public static bool SetCandidatePostionDetails(int pid, int cid, string status, string cname, string pname)
        {
            try
            {
                OpenConnection();
                SqlCommand cmd = new SqlCommand("SetPositionStatus", cnn);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@CandidateId", cid);
                cmd.Parameters.AddWithValue("@Status", status);
                cmd.Parameters.AddWithValue("@PositionId", pid);
                cmd.Parameters.AddWithValue("@CandidateName", cname);
                cmd.Parameters.AddWithValue("@PositionName", pname);

                var result = cmd.ExecuteNonQuery();
                if (result == -1)
                {
                    return false;
                }
                else
                    return true;
            }
            catch (Exception)
            {
                return false;

            }

        }

        public static bool SaveUserDetails(string name, string password, string tpe)
        {
            try
            {
                OpenConnection();
                SqlCommand cmd = new SqlCommand("SaveUserMaster", cnn);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Name", name);
                cmd.Parameters.AddWithValue("@Password", password);
                cmd.Parameters.AddWithValue("@LoginType", tpe);
                var result = cmd.ExecuteNonQuery();
                if (result == -1)
                {
                    return false;
                }
                else
                    return true;
            }
            catch (Exception)
            {
                return false;

            }

        }
        public static string GetLoginDetails(string username, string pass)
        {
            try
            {
                OpenConnection();
                string query = "Select  TOP 1 * from LoginMaster where Name='" + username + "' and Password='" + pass + "'";
                DataTable dt = new DataTable();
                SqlCommand cmd = new SqlCommand(query, cnn);
                SqlDataAdapter sqlDataAdapter = new SqlDataAdapter(cmd);
                sqlDataAdapter.Fill(dt);
                DataRow ds = dt.Rows[0];
                string name = ds["LoginType"].ToString();
                CloseConnection();
                return name;
            }
            catch (Exception)
            {
                return null;

            }

        }

    }
}