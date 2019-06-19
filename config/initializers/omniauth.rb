Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '433592010474964', '547da79dec038a932f4c846986398f63'
  provider :linkedin, '81q662zzjusm67', 'xZyEHlGAaZI8Gm9q'
  provider :google_oauth2, '244615150400-05thnta81fhg631up71t8v7e167i8pta.apps.googleusercontent.com', 'XW9LFZYGtLjruVh9kOpmCaRY'
  provider :twitter, 'y6kILe3VwuGpaFIIfPXdnv8pw', 'Gb76xJS6ZvTrzzxp0jNFLnZG2nNhNaaNPfx5FAWLrL5y11e14D'
end