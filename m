Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E7883A8727
	for <linux-renesas-soc@vger.kernel.org>; Wed, 18 Mar 2026 09:22:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773825772; cv=none; b=MkSGAe80ZbuwTmqkBdLbdK2G510UVA/kDBU0XrNOTLXvsGL/z4MRWVeeOJxycmExtN8+9RfXEApSNYAxLXkcRCFmnIeXOTJGPNMXfZFi3f/7kr9ckShXjRG3Ztpgg3nGMFWMknjmLMT6OJPcPi4YBYjQwkqyx3MnpunDlsYppUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773825772; c=relaxed/simple;
	bh=4IllvbPZHeu9EWBUL15CsbXwA0NWjkssX9E/wrU3ER8=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=hz88M5+gAdMrrBE9ZzOh6+q5nOjKNVbiZMa6hFrUdalNu1tBYQ6+UpvilmZYecU2sb/OLAv8je1/WIj4IUjbPc8cDLp/skrPQo4N4E7m1cgXfgxiML1Cqy1YSMttlUeP510xvNYuzIVlGISVyMCarxZlHO/6vFpX6CNfw35ejdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=XBL4Cn1L; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="XBL4Cn1L"
Received: from monstersaurus.ideasonboard.com (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1C238460;
	Wed, 18 Mar 2026 10:21:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1773825691;
	bh=4IllvbPZHeu9EWBUL15CsbXwA0NWjkssX9E/wrU3ER8=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=XBL4Cn1LSf3AtWg4/vg/UN9J7SUOzZAsuBjZmM6y7dvyxbVc6q8EqKUeSZBnJUsLd
	 fhJ9VwZoORqa70c6RySBqlrDeq5d7wE9qX3yeMIss69Smy7F0R83XNj3l6QEethe+s
	 hpHotnRht5TZhKNbwA8VyU39DCO+hWXb9hMWqDT0=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260317200413.433722-2-laurent.pinchart@ideasonboard.com>
References: <20260317200413.433722-1-laurent.pinchart@ideasonboard.com> <20260317200413.433722-2-laurent.pinchart@ideasonboard.com>
Subject: Re: [vsp-tests] [PATCH 1/2] vsp-lib: Drop unused variable
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc:
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, linux-renesas-soc@vger.kernel.org
Date: Wed, 18 Mar 2026 09:22:40 +0000
Message-ID: <177382576065.1533536.5118892415381098315@ping.linuxembedded.co.uk>
User-Agent: alot/0.9.1

Quoting Laurent Pinchart (2026-03-17 20:04:12)
> The vsp_runner variable is set to point to the vsp-runner.sh script,
> which has been removed in commit 306c53b308c2 ("vsp-lib: Replace
> vsp-runner script with a function from vsp-lib"). The variable is
> unused, drop it.
>=20
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
An easy one.

Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

> ---
>  scripts/vsp-lib.sh | 2 --
>  1 file changed, 2 deletions(-)
>=20
> diff --git a/scripts/vsp-lib.sh b/scripts/vsp-lib.sh
> index 85f3fdef69d1..2cabb9b96cde 100755
> --- a/scripts/vsp-lib.sh
> +++ b/scripts/vsp-lib.sh
> @@ -1105,8 +1105,6 @@ test_init() {
> =20
>         # Reset any rotation or flipping controls
>         vsp1_reset_controls wpf.0
> -
> -       vsp_runner=3D./vsp-runner.sh
>  }
> =20
>  test_start() {
> --=20
> Regards,
>=20
> Laurent Pinchart
>
