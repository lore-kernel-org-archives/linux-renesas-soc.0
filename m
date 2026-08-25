Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 443C7486BAB;
	Tue, 25 Aug 2026 15:44:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787672692; cv=none; b=edcz82GbJgkzKa48QXNqInAnCwDv/7dVwcOI1jss1/+7LldGZofAeYA0SMv5dqcIQgiDAc2vT0Gb7A3bebHLQ6TB0CSbzigEPPO1Yqxuu6UQFO7Zp/WHKMfQSvTVRTe5JPLi5XMVYxJnpSXUdxg6NBIAY90MnwH9sMbi5rtCfWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787672692; c=relaxed/simple;
	bh=2L8dutqGxZw/GzjcGTrsdGFtnQD5dZJNe471Y938LIE=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=gPw/Yhn4ty7SoT5DP+wBXnyqS/in9SDJyvRBARZyVQyTUMkW6EFJIj5DgrrsDqVztUcH2B6zJJK8XZ97OlFGFQg2C1Ck4ljeNsn+v1tBel8/oDvCv3kSXVTRpr6T+4ZAId/efT2I1W7YlGhoUCb/2WfRmGLiozNAuhXqmkt1VTg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=GmlSCNuy; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="GmlSCNuy"
Received: from monstersaurus.ideasonboard.com (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 36F341F8;
	Tue, 25 Aug 2026 17:43:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1787672596;
	bh=2L8dutqGxZw/GzjcGTrsdGFtnQD5dZJNe471Y938LIE=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=GmlSCNuyS4dtqdhd2aRI/hFeHUe4iRGAFVsPiTrhYpL4QyvUSMqgcxI5JtIndSXkE
	 7/lGDAkc1mUBT58/AGS56bn8Q1qtO/wlQ2Z5VxCSqWM6s78XIKXdt706QYxBXuyelv
	 ukIQYbOCslcjoYwHI5ZIPlp2eD4T9Wjm54jxx3D0=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260716034113.81187-1-lilinmao@kylinos.cn>
References: <20260716034113.81187-1-lilinmao@kylinos.cn>
Subject: Re: [PATCH] media: renesas: vsp1: Propagate runtime PM resume errors
From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Linmao Li <lilinmao@kylinos.cn>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Linmao Li <lilinmao@kylinos.cn>
Date: Tue, 25 Aug 2026 16:44:39 +0100
Message-ID: <178767267920.3929813.6764337371405621047@ping.linuxembedded.co.uk>
User-Agent: alot/0.9.1

Quoting Linmao Li (2026-07-16 04:41:13)
> vsp1_pm_runtime_resume() can fail while deasserting reset, initializing
> the device, or enabling the FCP. However, vsp1_pm_resume() ignores the
> return value from pm_runtime_force_resume() and restarts video pipelines
> even if the device failed to resume. This can access hardware that is
> still unavailable while reporting a successful system resume.
>=20
> Propagate the error and skip the pipeline restart when the device could
> not be resumed.
>=20
> Fixes: 1e6af546ee66 ("[media] v4l: vsp1: Implement runtime PM support")

This seems reasonable.


Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

> Signed-off-by: Linmao Li <lilinmao@kylinos.cn>
> ---
>  drivers/media/platform/renesas/vsp1/vsp1_drv.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/media/platform/renesas/vsp1/vsp1_drv.c b/drivers/med=
ia/platform/renesas/vsp1/vsp1_drv.c
> index 627b5046fa80..2a9f9f114575 100644
> --- a/drivers/media/platform/renesas/vsp1/vsp1_drv.c
> +++ b/drivers/media/platform/renesas/vsp1/vsp1_drv.c
> @@ -641,8 +641,11 @@ static int vsp1_pm_suspend(struct device *dev)
>  static int vsp1_pm_resume(struct device *dev)
>  {
>         struct vsp1_device *vsp1 =3D dev_get_drvdata(dev);
> +       int ret;
> =20
> -       pm_runtime_force_resume(vsp1->dev);
> +       ret =3D pm_runtime_force_resume(vsp1->dev);
> +       if (ret)
> +               return ret;
> =20
>         /*
>          * When used as part of a display pipeline, the VSP is stopped and
