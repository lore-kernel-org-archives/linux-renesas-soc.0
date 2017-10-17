Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mga01.intel.com ([192.55.52.88]:48335 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1757967AbdJQI0E (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 17 Oct 2017 04:26:04 -0400
From: Felipe Balbi <felipe.balbi@linux.intel.com>
To: Biju Das <biju.das@bp.renesas.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc: Simon Horman <horms@verge.net.au>,
        Chris Paterson <chris.paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-usb@vger.kernel.org, Biju Das <biju.das@bp.renesas.com>
Subject: Re: [PATCH] usb: renesas_usbhs: Add compatible string for r8a7743/5
In-Reply-To: <1507216358-917-1-git-send-email-biju.das@bp.renesas.com>
References: <1507216358-917-1-git-send-email-biju.das@bp.renesas.com>
Date: Tue, 17 Oct 2017 11:25:54 +0300
Message-ID: <87wp3uji3x.fsf@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha512; protocol="application/pgp-signature"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable


Hi,

Biju Das <biju.das@bp.renesas.com> writes:
> This patch adds support for r8a7743/5 SoC.  The Renesas RZ/G1[ME]
> (R8A7743/5) usbhs is identical to the R-Car Gen2 family.
>
> This doesn't change the driver, so it does nothing by itself.  But it does
> mean that checkpatch won't complain about a future patch that adds
> "renesas,usbhs-r8a7743" or "renesas,usbhs-r8a7745" to a DT, which helps
> ensure that shipped DTs use documented compatibility strings.
>
> Signed-off-by: Biju Das <biju.das@bp.renesas.com>
> ---
> This patch is tested against Linux next tag next-20170929

care to rebase on my testing/next? It fails to apply.

While doing that, please collect all Acks given.

8<------------------------------------------------------------------------

checking file Documentation/devicetree/bindings/usb/renesas_usbhs.txt
Hunk #2 FAILED at 12.
1 out of 2 hunks FAILED

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEElLzh7wn96CXwjh2IzL64meEamQYFAlnlvpMACgkQzL64meEa
mQaEbA//d1GTMrjBybTGKlYFgQF+5B+Q7NfXY9pw0XfaqcxFD2tgxZCNNwG1VCeM
XR9SHsSArg7HB9iop2LM99Kgu9NexcqhLA2tAdnq1+rEcehg0n1ICUqOd3KluHlF
5bKLgW06G/vD1lWiVDnJmrqqxa+fIXHQ+pOU3NMkIZjL/jbjttv1e7/86Y5+j+P5
LmCHouH4SyAN41iiv9sSiTr31k//NMixx3UAn/awMF9vlw/fYFMV1uX/JuJo5Hw/
bEtJLxW8PuPWX/2CiNyuPzEUJ7vqfiTWyj5GFqkfLomk7PbilcFHooMmYlvY3Ww6
8Mtlg6SBDqkDnJzruJ/wfMLPEud/EEO13x3yUxi0YPYhG37jcX3CRebrikKTa305
O0NMulqQnEg0hJdQQbEm58wOho7Abjbo7kBQy5aSXbcQOIhNgWZPLjcT/UGjntLa
PgMdyqGEpTwFlnNgB+uLLV8QKWguwU8hflbPaoko80qlXrvIBDaUT0kclIK8+YCa
atMzC5QZnStqggQSjKmvsmH20kwRJJSnF5DG7rnNYv1OoS3GF1GzXvilZGAAqVO8
+9DVln48T/QFwhAzJpY1V+LZgBKip8VcTHRhg4A0EVrjRG7UIRI1tBrWKD3wP3vu
2Mx/2LFmQIfU3T+ywhToG422b4qkNT4cabOtaBrnlDKHblws8NU=
=F+RY
-----END PGP SIGNATURE-----
--=-=-=--
