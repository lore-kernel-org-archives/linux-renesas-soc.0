Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FD5C519DE9
	for <linux-renesas-soc@vger.kernel.org>; Fri, 18 Sep 2026 16:45:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789749922; cv=none; b=ZvR2Vl4QDgdbL7QitBzVVZjBUKJ8+Q/3OJPqkioOcmQyhu+OYzI8EngN5wyr4+NhXZDAXqADVbqSzTxy4w0GFlS/4sO6oiuxvc3BRcd9B71vSERMz3ixSm3VRDxIGM2siLu0FyiplUv9t8UIMU7Mn+CGS22TAGEtbm32GMj/Hyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789749922; c=relaxed/simple;
	bh=rxxDGyuBUjCghU61l2Y/esKJdU86vBGusi79Xr0hBL0=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=V30Q+h6c+k7DY0IkKpaMTVx+yiUOi3DNeM2+7TAUrYu5AHNQvODp2UjHUvs4BXQI7J5sfPdwjGUfgU+XCYkaBb6jA0s3PmU0Nu+5CMZUux0KWOi9tp1SHO6xs2460zwlI6WMIyLV3G8phDyLEJjZ7JBGAoas5VP/WNr7E1p128s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=u5/coWek; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="u5/coWek"
Received: from neptunite.rasen.tech (unknown [IPv6:2400:2411:160:2f00:e327:a298:3a5b:4b08])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id AAD2C4F09;
	Fri, 18 Sep 2026 18:43:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1789749815;
	bh=rxxDGyuBUjCghU61l2Y/esKJdU86vBGusi79Xr0hBL0=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=u5/coWekDOVc/spsBoxUcvfGSLwERq4kH3UPcvJO1GbYz+yySXvhpj0BwKF7yg5OM
	 RmaEkrHwmP9NMCOKji+xFYUMQLXXtJ70CggbOP7If8l/iGb+RrrbqLsZx4kg6elV7g
	 N8mM2rWCvZzI8Fp4c06LuP7caqDzXaSdmcglPw98=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260918013631.735399-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20260918013631.735399-1-laurent.pinchart+renesas@ideasonboard.com>
Subject: Re: [vsp-tests] [PATCH] vsp-tests: Fix location of CLU input data
From: Paul Elder <paul.elder@ideasonboard.com>
Cc:
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, linux-renesas-soc@vger.kernel.org
Date: Sat, 19 Sep 2026 01:45:12 +0900
Message-ID: <178974991210.52643.8747414616972717294@neptunite.rasen.tech>
User-Agent: alot/0.0.0

Quoting Laurent Pinchart (2026-09-18 10:36:31)
> Since commit cd7de9f4e613 ("Install in FHS-compatible locations"), data
> files have been moved to datadir and are accessed relatively to the
> libexec directory. The vsp-unit-test-0010.sh test hasn't been updated
> and still references CLU input data files from the current directory.
> Fix it.
>=20
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.co=
m>

Reviewed-by: Paul Elder <paul.elder+renesas@ideasonboard.com>

> ---
>  tests/vsp-unit-test-0010.sh | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/tests/vsp-unit-test-0010.sh b/tests/vsp-unit-test-0010.sh
> index 1878e6a809c2..c187b2101715 100755
> --- a/tests/vsp-unit-test-0010.sh
> +++ b/tests/vsp-unit-test-0010.sh
> @@ -27,7 +27,7 @@ test_lut() {
> =20
>         test_start "$(echo $lut_type | tr [:lower:] [:upper:]) in $format=
 with $config configuration"
> =20
> -       local config_file=3Dframes/${lut_type}-${config}.bin
> +       local config_file=3D${in_frames_dir}/${lut_type}-${config}.bin
> =20
>         pipe_configure rpf-${lut_type}
>         format_configure rpf-${lut_type} $format 1024x768
>=20
> base-commit: b7bbca0dd187d85428edaecfc08c948bba72152d
> --=20
> Regards,
>=20
> Laurent Pinchart
>
