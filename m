Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from perceval.ideasonboard.com ([213.167.242.64]:45128 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751065AbeEUIQK (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 21 May 2018 04:16:10 -0400
Subject: Re: [PATCH 2/2] tests: suspend/resume: Increase number of processed
 frames
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-renesas-soc@vger.kernel.org
References: <20180519203426.25711-1-laurent.pinchart@ideasonboard.com>
 <20180519203426.25711-3-laurent.pinchart@ideasonboard.com>
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Message-ID: <9f68f70c-089f-58f9-1e30-3e53b85acca4@ideasonboard.com>
Date: Mon, 21 May 2018 09:16:05 +0100
MIME-Version: 1.0
In-Reply-To: <20180519203426.25711-3-laurent.pinchart@ideasonboard.com>
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature";
 boundary="jl3vLqnknpY59p0xf1Awrrh5DURCfPM6T"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--jl3vLqnknpY59p0xf1Awrrh5DURCfPM6T
Content-Type: multipart/mixed; boundary="ZbsPcNOcYHbpj4Cjg2VSbm4kYdQmw9jmr";
 protected-headers="v1"
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-renesas-soc@vger.kernel.org
Message-ID: <9f68f70c-089f-58f9-1e30-3e53b85acca4@ideasonboard.com>
Subject: Re: [PATCH 2/2] tests: suspend/resume: Increase number of processed
 frames
References: <20180519203426.25711-1-laurent.pinchart@ideasonboard.com>
 <20180519203426.25711-3-laurent.pinchart@ideasonboard.com>
In-Reply-To: <20180519203426.25711-3-laurent.pinchart@ideasonboard.com>

--ZbsPcNOcYHbpj4Cjg2VSbm4kYdQmw9jmr
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: quoted-printable

Hi Laurent,

Thank you for the patch,

On 19/05/18 21:34, Laurent Pinchart wrote:
> The suspend/resume test starts a run of 300 frames and suspends the
> system one second later. On some SoCs (namely H3 ES2.0) the VSP
> bandwidth is high enough to complete processing of 300 frames in less
> than a second. The test thus suspends and resumes the system with the
> VSP idle instead of running, defeating the purpose of the test.
>=20
> Fix this by increasing the number of frames to process to 1000. The
> frame count is now passed as an argument to the
> test_extended_wpf_packing function to ease future changes.

Great idea, to make it easy to update and re-use.

> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

> ---
>  tests/vsp-unit-test-0020.sh | 15 ++++++++-------
>  1 file changed, 8 insertions(+), 7 deletions(-)
>=20
> diff --git a/tests/vsp-unit-test-0020.sh b/tests/vsp-unit-test-0020.sh
> index 91f6b167f22e..950c1bebbf2f 100755
> --- a/tests/vsp-unit-test-0020.sh
> +++ b/tests/vsp-unit-test-0020.sh
> @@ -15,25 +15,26 @@ features=3D"rpf.0 wpf.0"
>  # These can be extracted from /sys/power/pm_test
>  suspend_modes=3D"freezer devices platform processors core"
> =20
> -# This extended function performs the same
> -# as it's non-extended name-sake - but runs the pipeline
> -# for 300 frames. The suspend action occurs between frame #150~#200
> -
> +# This extended function performs the same as it's non-extended name-s=
ake, but
> +# runs the pipeline for a configurable number of frames.
>  test_extended_wpf_packing() {
>  	local format=3D$1
> +	local num_frames=3D$2
> =20
>  	pipe_configure rpf-wpf 0 0
>  	format_configure rpf-wpf 0 0 ARGB32 1024x768 $format
> =20
> -	vsp_runner rpf.0 --count=3D300 &
> -	vsp_runner wpf.0 --count=3D300 --skip=3D297
> +	vsp_runner rpf.0 --count=3D$num_frames &
> +	vsp_runner wpf.0 --count=3D$num_frames --skip=3D$((num_frames-1))

The original test compared up to 3 frames... But I guess as long as one f=
rame
matches we're good on this test. We just need to know the pipeline was st=
ill
running... and 3 frames doesn't provide much more information than one.

> =20
>  	local result=3D$(compare_frames)
>  	[ x$result =3D=3D xpass ] && return 0 || return 1
>  }
> =20
>  test_hw_pipe() {
> -	test_extended_wpf_packing RGB24
> +	# Run the pipeline for 1000 frames. The suspend action occurs between=

> +	# frame #500~#600

I'm not sure it's worth stating when the suspend action occurs, as it's v=
ariable
depending upon the performance of the SoC ... but I'll not object to this=
=2E

> +	test_extended_wpf_packing RGB24 1000
>  }
> =20
>  test_suspend_resume() {
>=20


--ZbsPcNOcYHbpj4Cjg2VSbm4kYdQmw9jmr--

--jl3vLqnknpY59p0xf1Awrrh5DURCfPM6T
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEkC3XmD+9KP3jctR6oR5GchCkYf0FAlsCgEUACgkQoR5GchCk
Yf0PUhAAocAwT/mGnIxXHszlfnKuWzFqVAucYcu7MAVEEHtGr5QIcSH/PQs53CXc
rzxBvBW+E/7S/+QdxZNZwuEWStEKpXTQ+MJVivuLm5pkWtoaneOylLhGVbY21PJB
KRYtb8uyvMat1fMz7j0ybhiXmePw1MGzyhexrI1jkTQURftI1J+q/qcyFuBRsF2X
lQ011EmJUjZmgSJfYu/t3v3D9XKyCb5A8sz3VNHbN0bQizp4ppqFtgoPF7fqapyE
/Xd2VCjfEMsvoSyl4WhRi6/w4gKkXnsnrobVHVOYmgRWllJI3oR1DS0farY1ZIl7
dz6bpseGRkid+ruInQoZs+8J+CeHCNDK+DnC5MeU/7vQ3eQgwuW+n5QSFA754pnm
dzXmhKf9GBt3Q9XBuF9BnW3yJ1k5y55ozaE5sfHVBY9NVPajBsr8cjLNe83OKVXy
ZRpm4qCa6bie6NNBXdEflNdeQbvXwg6uY588ZOjtgjE16Hc6nDxSyV561HBr/PCS
LJcFaQB7WtEyzNchACFgTCabycqwHrSw80zKJhenyEoUlZ+uOQLGwNrmNEutuLF6
NhEjwhdrAhJ4m+sDuiYqHEUbbRZ/PRs5867MNNySbzZFs0OJPqmLPU32nHJgt81J
+VKPvCYdXxhYq9NcGV8W03hwoAJqFb0zB2Un7PkEjmmNBK7E5a4=
=1RFG
-----END PGP SIGNATURE-----

--jl3vLqnknpY59p0xf1Awrrh5DURCfPM6T--
