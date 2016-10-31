Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([89.238.76.85]:48462 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S935896AbcJaLqd (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 31 Oct 2016 07:46:33 -0400
Date: Mon, 31 Oct 2016 12:46:25 +0100
From: Wolfram Sang <wsa@the-dreams.de>
To: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org, horms@verge.net.au,
        geert@linux-m68k.org, magnus.damm@gmail.com
Subject: Re: [PATCH v2 0/5] r8a7796 I2C integration
Message-ID: <20161031114625.GB1435@katana>
References: <1477491249-2976-1-git-send-email-ulrich.hecht+renesas@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="uZ3hkaAS1mZxFaxD"
Content-Disposition: inline
In-Reply-To: <1477491249-2976-1-git-send-email-ulrich.hecht+renesas@gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--uZ3hkaAS1mZxFaxD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> This revision is based on renesas-devel-20161024-v4.9-rc2.  It adds the
> Reviewed-bys and the entries for SYS-DMAC2 in the applicable I2C nodes.  I
> have also made sure it works with 64-bit memory enabled.


I'd like to test, but: can you tell me which branches are needed to test
DMA? Or is there a complete branch available somewhere? Or could you
update the branch of this feature which is pulled in by renesas-drivers?


--uZ3hkaAS1mZxFaxD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJYFy8QAAoJEBQN5MwUoCm2MqQQAKl+t3CDV40BdTebD8Yl6iSu
PT1XSEuxxgyL8T3VG7MJuEkCqXWlbjIJ5bG1q/ckvivS3CWb+yMW0eZpu8nNAk26
YKZ8oW/3Ww8iFPVKWnmn7GYuePiMLYnA2ycfyXngV0JtjzZC27HlqPvENRiKz7Pv
R3ANLQOov5MH5fw6vCBKCv7lCS/LlGB3NvE/MqiOfrJlG7OhaJV1C0eax/anaNxk
IvICvR34ph3TmT2nNCSG9lwWqNuOFlu5AKoUiPrkxkZnDDr5GwchsY+TeWyaslSx
oNEfmarPRmKhX6UoHSvSvjPQMMPI7KbrfreDrbNdiQNYJmkmNJGuvSCdtk6tszUa
fB2uY/XkjqB2iPeiaDphiQzeAmNZHUN6GktX2Nd0qJLo7du8QutxdgtVDaTotQlA
UviXeVneMtpYe5L16huEuFeC8hTzGUYytCI7rsXOvPdS4JL6vXvb5+VvbtMGPZvW
u6cX0PcUIbE90O1Ig+L9xMzOQPNZgmp+JYdo8BnOCFqWQQkcIX4jv6IcnAdO+dnn
fFENgPxwi4KaoCpT6duSdoDluj30PeR/15L+K7kmHHtAKBDhbfw8uWRgCe7ta03m
9eVXtwJaxiEFrfCUHBGh/Dvwu9P0m6vpYEp9SxgDOP6bRDnIxCRcS9Ud5bXw43pX
EUm1iu7Qm2VJP2wA6Mvk
=AOh0
-----END PGP SIGNATURE-----

--uZ3hkaAS1mZxFaxD--
