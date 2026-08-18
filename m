Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60DC33D25D2;
	Tue, 18 Aug 2026 11:33:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787052787; cv=none; b=bU9GbeVa9WUh09C1+LuST2yqpfQBquKWwNdPDtNSQjElp8uRumjDzyvCJ0NuD5UZ62qkeKdh4E2yRXGVr9+3HEN8ABN78xYePWdJ1wOP9NWcHpD/pJx5kK4QVPNZ23St2894Sxpo097HlCHOIDXZJEkrAqVu8fFMBKlKZ2Qjf/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787052787; c=relaxed/simple;
	bh=brFS7fLUUPpLfxpcR/RWc/YrGG2hIhZvLyEPm7RAbVg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iNVF52egbuwGjP/tQNs8TPl/SFei7FvPpO44p+KdegkoDjwIPK5tSzuA5VpCdHYrBZRR6unwwYQx2KtNNHMPO+4m18JafOJ3uIQggoq38Dc5Fe6Y5B0JXaGyrZFtyJW4ZPwgjPD9MvokBY0EegKiKSj7L9XdFmM0paB17NxHsqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=pjIwuTE2; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="pjIwuTE2"
Received: from ideasonboard.com (mob-109-113-29-237.net.vodafone.it [109.113.29.237])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0AE2A1B41;
	Tue, 18 Aug 2026 13:31:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1787052703;
	bh=brFS7fLUUPpLfxpcR/RWc/YrGG2hIhZvLyEPm7RAbVg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pjIwuTE2nlFZ4m8BORDmz6hTlyIPdvOd9vKx8deqV64EJd2Khex4v3mwLnLVEqqWt
	 rZiFclzwAJ3ajui+Ikl5obAvGz1fmzZ2QPbQ3YZXexk4MG2zlaR0+LYJR7FbFSV5Mo
	 Ym4sgGQaJd7c4EpfG5AI0mnxZw8GkhmGAjMgIUlc=
Date: Tue, 18 Aug 2026 13:32:59 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Linmao Li <lilinmao@kylinos.cn>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: renesas: vsp1: Propagate runtime PM resume errors
Message-ID: <aoRCyM9VJfLIeCWF@zed>
References: <20260716034113.81187-1-lilinmao@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260716034113.81187-1-lilinmao@kylinos.cn>

Hi Linmao Li

On Thu, Jul 16, 2026 at 11:41:13AM +0800, Linmao Li wrote:
> vsp1_pm_runtime_resume() can fail while deasserting reset, initializing
> the device, or enabling the FCP. However, vsp1_pm_resume() ignores the
> return value from pm_runtime_force_resume() and restarts video pipelines
> even if the device failed to resume. This can access hardware that is
> still unavailable while reporting a successful system resume.
>
> Propagate the error and skip the pipeline restart when the device could
> not be resumed.
>
> Fixes: 1e6af546ee66 ("[media] v4l: vsp1: Implement runtime PM support")
> Signed-off-by: Linmao Li <lilinmao@kylinos.cn>

Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

> ---
>  drivers/media/platform/renesas/vsp1/vsp1_drv.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/media/platform/renesas/vsp1/vsp1_drv.c b/drivers/media/platform/renesas/vsp1/vsp1_drv.c
> index 627b5046fa80..2a9f9f114575 100644
> --- a/drivers/media/platform/renesas/vsp1/vsp1_drv.c
> +++ b/drivers/media/platform/renesas/vsp1/vsp1_drv.c
> @@ -641,8 +641,11 @@ static int vsp1_pm_suspend(struct device *dev)
>  static int vsp1_pm_resume(struct device *dev)
>  {
>  	struct vsp1_device *vsp1 = dev_get_drvdata(dev);
> +	int ret;
>
> -	pm_runtime_force_resume(vsp1->dev);
> +	ret = pm_runtime_force_resume(vsp1->dev);
> +	if (ret)
> +		return ret;
>
>  	/*
>  	 * When used as part of a display pipeline, the VSP is stopped and
>
