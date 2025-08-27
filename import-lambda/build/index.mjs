export const handler = async (event) => {
  const response = {
    statusCode: 200,
    body: JSON.stringify('Another hello world from Terraform!'),
  };
  return response;
};