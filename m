Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D55D37189B;
	Mon, 22 Jun 2026 08:06:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782115620; cv=none; b=b8fzbzaZLR4Lhwij/SJj2L0OEZHvewpakBALfPHoqo/KA4LkSkBcDz/IvVsyKBTiyKCAL6C6udrApSdg3kD+DqeWN0ibc4Rq2SZZQbRwJ9t8LPj6HG8kmJ3RkvoZcrJFE6GLkUOcZPQXtlaTTnat63Em92J8JeQm2tT4sjwAPQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782115620; c=relaxed/simple;
	bh=j+ZiNP/2iXlbvglh0ym+BSqUGqjaYgLNKPDF1Q2zDlg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jkt3DBsS6jotIx6Md9ak/y8/KcnR+99uc+bTNNKpQ6NfM9Q+rG9vR2qiTX4L28/zGBzfC6SHA5GDwqtuzivOK2wZnooMTbJQOpqfBUOKjgN6ljIYZrc0I+duUVr1WB6pRxq6d1ZS/KsKZ9RCuHJrwJUyXcrQl7afRlgovPcUEro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=LW9sObFc; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="LW9sObFc"
Received: from ideasonboard.com (mob-109-113-9-173.net.vodafone.it [109.113.9.173])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id A1285219;
	Mon, 22 Jun 2026 10:06:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1782115579;
	bh=j+ZiNP/2iXlbvglh0ym+BSqUGqjaYgLNKPDF1Q2zDlg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LW9sObFcqbKY7FNH+xfCY/EkejIuiY5MIj8eFI90901BHQWJ3lZBXQ4yU6ygHkXH7
	 I0JheXAhGv3XcevtUYk/V/zKrnslWlxhiiKJnIzZQ+uqwbP164Q1JWRjFAG9dQoPHk
	 Sk+7JMIf3zGsxGe2po5661fv6TxfdZeoPQJ4dYW0=
Date: Mon, 22 Jun 2026 10:06:54 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Biren Pandya <birenpandya@gmail.com>
Cc: linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	laurent.pinchart@ideasonboard.com, sakari.ailus@linux.intel.com, mchehab@kernel.org
Subject: Re: [PATCH v2 1/4] media: renesas: rcar-csi2: Add missing
 media_entity_cleanup()
Message-ID: <ajjsrRVdvV-tkr-i@zed>
References: <20260619102241.22887-6-birenpandya@gmail.com>
 <20260619121729.24899-5-birenpandya@gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260619121729.24899-5-birenpandya@gmail.com>

Hi Biren

On Fri, Jun 19, 2026 at 05:47:30PM +0530, Biren Pandya wrote:
> The probe error paths and remove function are missing calls to
> media_entity_cleanup(). Add them and introduce an err_entity label
> to ensure teardown logic properly inverses initialization.
>
> Signed-off-by: Biren Pandya <birenpandya@gmail.com>

Have you at least compiled this patch ?

../drivers/media/platform/renesas/rcar-csi2.c: In function ‘rcsi2_probe’:
../drivers/media/platform/renesas/rcar-csi2.c:2634:1: error: label ‘error_entity’ defined but not used [-Werror=unused-label]
 2634 | error_entity:
      | ^~~~~~~~~~~~

Also, don't send v(n+1) in reply to v(n). Each version of a series
goes in its own thread, with a proper cover letter and changelog.

I suggest to use b4.

> ---
>  drivers/media/platform/renesas/rcar-csi2.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/drivers/media/platform/renesas/rcar-csi2.c b/drivers/media/platform/renesas/rcar-csi2.c
> index 7305cc4a04cb..61d7dfe14688 100644
> --- a/drivers/media/platform/renesas/rcar-csi2.c
> +++ b/drivers/media/platform/renesas/rcar-csi2.c
> @@ -2631,6 +2631,8 @@ static int rcsi2_probe(struct platform_device *pdev)
>  	v4l2_subdev_cleanup(&priv->subdev);
>  error_pm_runtime:
>  	pm_runtime_disable(&pdev->dev);
> +error_entity:
> +	media_entity_cleanup(&priv->subdev.entity);
>  error_async:
>  	v4l2_async_nf_unregister(&priv->notifier);
>  	v4l2_async_nf_cleanup(&priv->notifier);
> @@ -2646,6 +2648,7 @@ static void rcsi2_remove(struct platform_device *pdev)
>  	v4l2_async_nf_cleanup(&priv->notifier);
>  	v4l2_async_unregister_subdev(&priv->subdev);
>  	v4l2_subdev_cleanup(&priv->subdev);
> +	media_entity_cleanup(&priv->subdev.entity);
>
>  	pm_runtime_disable(&pdev->dev);
>  }
> --
> 2.50.1 (Apple Git-155)
>
>
