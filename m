Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:56270 "EHLO
	mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752056AbcF2SSw (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Wed, 29 Jun 2016 14:18:52 -0400
Date: Wed, 29 Jun 2016 19:17:51 +0100
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Linux-ALSA <alsa-devel@alsa-project.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Simon <horms@verge.net.au>, linux-renesas-soc@vger.kernel.org
Message-ID: <20160629181750.GL6247@sirena.org.uk>
References: <87fusysjam.wl%kuninori.morimoto.gx@renesas.com>
 <874m9esj22.wl%kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="1hKfHPzOXWu1rh0v"
Content-Disposition: inline
In-Reply-To: <874m9esj22.wl%kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH 08/39 v2] ASoC: simple-card-utils: add
 asoc_simple_card_parse_card_prefix()
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--1hKfHPzOXWu1rh0v
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, May 31, 2016 at 09:01:58AM +0000, Kuninori Morimoto wrote:

> +int asoc_simple_card_parse_card_prefix(struct snd_soc_card *card,
> +				       struct snd_soc_dai_link *dai_link,
> +				       struct snd_soc_codec_conf *codec_conf,
> +				       char *prefix)
> +{
> +	char prop[128];
> +
> +	snprintf(prop, sizeof(prop), "%sprefix", prefix);
> +
> +	snd_soc_of_parse_audio_prefix(card, codec_conf,
> +				      dai_link->codec_of_node,
> +				      prop);
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(asoc_simple_card_parse_card_prefix);

Similar thin wrapper comment as before: what is this offering over the
underlying function?

--1hKfHPzOXWu1rh0v
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJXdBDNAAoJECTWi3JdVIfQTCkH/0yM0Z5sMIpq7zvUvhQyvhDU
Okzut02lzVPVFeNImnfGgxHW72IxHVgLwKVImLMID/CXSk6rDMXAgatt3Hw+DDF+
aVAQnkndAykDLsGedJlKqxT5R6711Jbc9ZO1goBdtZZYp0H/eSYJRwzTluIE8NKC
Ec2PlpZ14RBwxLjoVeBsoi57mKgnelQHCj+11gYF6B6hjdPYxsBW+iXzMTBxip3M
PE8/51dWW6qB9QijMmf01GVHEPTtlHDYBqV8oRMj/FZMcCBVotqYlHZuF0h5yb2+
1Ktu1HfffT9ccb5CFCQ/smJ2hEZME7pa4x+lkGpo0fEQ0SgHYUu+Hltwm5ON5NM=
=v6J/
-----END PGP SIGNATURE-----

--1hKfHPzOXWu1rh0v--
