Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:44072 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729808AbeHFRJd (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 6 Aug 2018 13:09:33 -0400
Date: Mon, 6 Aug 2018 16:59:58 +0200
From: Wolfram Sang <wsa@the-dreams.de>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-ide@vger.kernel.org,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Tejun Heo <tj@kernel.org>,
        Masaharu Hayakawa <masaharu.hayakawa.ry@renesas.com>
Subject: Re: [PATCH] ata: sata_rcar: exclude setting of PHY registers in Gen3
Message-ID: <20180806145958.k7bt6buvekfbyxnw@ninjato>
References: <20180806104200.29102-1-wsa+renesas@sang-engineering.com>
 <CAMuHMdWAg8VmXpx_R2ROO-PwjaoWFv6Sc8PpoJqePkXGNh9rvw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="ybswzydpteggxpy7"
Content-Disposition: inline
In-Reply-To: <CAMuHMdWAg8VmXpx_R2ROO-PwjaoWFv6Sc8PpoJqePkXGNh9rvw@mail.gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


--ybswzydpteggxpy7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> "platform suspend"? Is that s2ram aka a full PSCI system suspend?

It is this:

echo platform > /sys/power/pm_test
echo mem > /sys/power/state

Is there a better name for it?

The HDD was also spinning down/up during the cycle...

> I guess not, as it is supposed to fail without PCA9654 suspend/resume support...

Yeah, I was wondering about that last time, too.

> So more information is needed to convince me ;-)

Here they are :)


--ybswzydpteggxpy7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAltoYmoACgkQFA3kzBSg
KbZOmg//QDwIn6SXfnkwuigHGfLxiW3sHkP9a4K7UCUKK6S/W6G/+hLjKyuIjkK0
+Xx22ze/uAnVN0hheL4eMLstNdEHW7KPN2n4StUq165KkKCGhXKmNApRxnQL228m
ou/JBf79rkmw28X9/+zaTKAzk40hNycD6xPJ3Gh04/wJYLEPDJXIKBUD/hKttaZD
TlqeexXY9FDnweC/9+ZcnuI/odWjm3QSkGAH7gRQmhvzvQd3msnf864a8yA3Zprj
s0YR/UM4RH+1Oj0JZcHlYsrcWEIzE/sOaVw07/fhlFB4oJk48vcx4AA5ETd1N8wL
ECtBqfrEWLORypuFmhPMrqENRXZx2Ik7WKqI28j+TQTYV7HDi101C61d+6YKT9oG
hoopEjAKpxNSTy/ylWXb0HoAwSxTP5T2ySG4NOSdD13nE/xgxvCPiRF9xnKyLlZu
nUwtxgxmfxZoFNVYUwDRh5grBmku1phTv+FVoiBenIrHk8mlgj7dkdxRs/xd9IEF
9YXPJECNf/Anvn/PI70gvzErIBlnO04Hu9+67muYZjW2JCWG8pNFCu+Pqrz4Xs7p
otsP2AR5/nHIneYWzCxGT2HLQUM8edcHDFpbF5+573Pt65sdjeMjpMLAysUNgVZT
NhhuVseCBPEPrcBLeSC5P/0Z97A2NS22FN/R7/t2eKURro6jznY=
=GqDw
-----END PGP SIGNATURE-----

--ybswzydpteggxpy7--
