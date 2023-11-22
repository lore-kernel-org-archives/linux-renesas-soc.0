Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="QBnBR1D8"
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CF67E2724
	for <linux-renesas-soc@vger.kernel.org>; Wed, 22 Nov 2023 07:44:59 -0800 (PST)
Received: from pendragon.ideasonboard.com (aztw-30-b2-v4wan-166917-cust845.vm26.cable.virginm.net [82.37.23.78])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id EF8A929A;
	Wed, 22 Nov 2023 16:44:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1700667867;
	bh=7Ouf7WbEXuGnMv82oVsiUumWn/UoALHR9X6wfPvqLcU=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=QBnBR1D88hlzfG8S5uw/xWO5aE6sryJ0CGBXonw7U3UgCYETq/BkfDXayWqRsTqzM
	 fe9VQackhsnnGhzonMyxWSn4dg2jOn8BOVbyQ5Z3NPPmdFRyNAcHYFx5xbZ1IPtgJO
	 czaB8piKr3EGxr3/liXwo/0OCNH4iPF+gRmBKPO4=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20231114131211.24462-1-laurent.pinchart@ideasonboard.com>
References: <20231114131211.24462-1-laurent.pinchart@ideasonboard.com>
Subject: Re: [vsp-tests] [PATCH v2 1/2] scripts: Fix computation of the total number of tests
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc:
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, linux-renesas-soc@vger.kernel.org
Date: Wed, 22 Nov 2023 15:44:54 +0000
Message-ID: <170066789494.630990.1416303318797398514@ping.linuxembedded.co.uk>
User-Agent: alot/0.10

Quoting Laurent Pinchart (2023-11-14 13:12:10)
> If a test scripts outputs a line that doesn't match the
> pass/fail/skipped criteria, the line is counted in the total number of
> tests run, but not attributed to any individual category. This results
> in a summary message such as
>=20
>         189 tests: 170 passed, 0 failed, 3 skipped
>=20
> Fix it by ignoring those lines.

Eugh - indeed.

Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

>=20
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
> Changes since v1:
>=20
> - Don't drop skipped tests handling
> ---
>  scripts/vsp-tests.sh | 16 ++++++++++++----
>  1 file changed, 12 insertions(+), 4 deletions(-)
>=20
> diff --git a/scripts/vsp-tests.sh b/scripts/vsp-tests.sh
> index e6cae04ebf0b..7805f1b7de1c 100755
> --- a/scripts/vsp-tests.sh
> +++ b/scripts/vsp-tests.sh
> @@ -29,10 +29,18 @@ run_test() {
> =20
>         local output=3D$(./$script 2>&1 | tee /proc/self/fd/2)
>         for line in $output ; do
> -               (echo "$line" | grep -q 'fail$') && num_fail=3D$((num_fai=
l+1))
> -               (echo "$line" | grep -q 'pass$') && num_pass=3D$((num_pas=
s+1))
> -               (echo "$line" | grep -q 'skipped$') && num_skip=3D$((num_=
skip+1))
> -               num_test=3D$((num_test+1))
> +               local pass=3D0
> +               local fail=3D0
> +               local skipped=3D0
> +
> +               (echo "$line" | grep -q ': fail$') && fail=3D1
> +               (echo "$line" | grep -q ': pass$') && pass=3D1
> +               (echo "$line" | grep -q ': skipped$') && skipped=3D1
> +
> +               num_fail=3D$((num_fail+fail))
> +               num_pass=3D$((num_pass+pass))
> +               num_skipped=3D$((num_skipped+skipped))
> +               num_test=3D$((num_test+pass+fail+skipped))
>         done
> =20
>         if [ $(ls *.bin 2>/dev/null | wc -l) !=3D 0 ] ; then
>=20
> base-commit: 9a37e24c2456103d146e0251765ae43df6f72f7e
> --=20
> Regards,
>=20
> Laurent Pinchart
>
