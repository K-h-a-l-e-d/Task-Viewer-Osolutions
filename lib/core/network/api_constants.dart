// ignore: constant_identifier_names
const PROJECT_ID = String.fromEnvironment('PROJECT_ID');
// ignore: constant_identifier_names
const ANON_KEY = String.fromEnvironment('ANON_KEY');

abstract class ApiConstants {
  static const tasksApiBaseUrl = 'https://$PROJECT_ID.supabase.co/rest/v1';

  static const headers = {
    'authorization': 'Bearer $ANON_KEY',
    'apikey': ANON_KEY,
    'Content-Type': 'application/json',
    'Prefer': 'return=representation',
  };
}
