Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45EE33B3884
	for <linux-renesas-soc@vger.kernel.org>; Fri, 28 Aug 2026 09:35:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787909757; cv=none; b=UME8ExRTS7bPAVm91uoTU55XeGfmj5skne7RvLHIQoRfRdSIlKZdjjPTIGCwQxJFh5Cox7T1hMRkLfWj4eeK8SAMINexNLbAQmxOV8ZQN6xywX6lnIL0uMHnYVJ3DXco2aylKNxA1A3WvAdl0dGmLpE/REuQCinBxqpMz1NnbZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787909757; c=relaxed/simple;
	bh=TALOrbmNVabspWfRaGv64vu6hD+Bv94mCfARw0OxHgM=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GnJint+2BbTnP2q5haRPuKp61d40YsY/d4+4EnOUrbLyvVEQcXwt4CaOHquWo6TvnWb/rUvYpRlA7sE3ucD14O7XY9EASqFmeqnfMK0XO5PdESiRX9oASK1JjRRjNmYhCQS2InkwRhGTvSvqZljOF2zXr/nYfYsdUCyGWVv+1tQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gIN8r/kD; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gIN8r/kD"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4998b5a63e2so7011425e9.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 28 Aug 2026 02:35:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787909746; x=1788514546; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8+teJGumSEtzE5yE/4xiLp6Nr2szYZ1P4IJfEUhRobY=;
        b=gIN8r/kDGMsWwk98Ucu/8jUkrIWxONe1ItJVBJBJCXXNljLYKe0YgafWY5K8jaHi0l
         sDhVCmNLg1r4R/iaIP9TqJid/vpxyy3ldwS6SGJ7xs9v3V4h7qzxc3pYcyFVKfZP7N7Q
         2a4FwMjhfLTCubPHFBzO+jO3Jqbz4Obg6mYAtXhTPK2M+IBFZ1OU5CMFndePPBRNHJ0C
         oUDGtBDrzsVCLMaKpsrxaOj9mhV7Q2V38rQMfIrxhUOJBrzWnSGre/1jpTGqMh0lvZ9g
         olJsJzC4y1nJQnCaIOnKSMDCovikfd46vJifxDWKuQEjLBc7XY5W3aRJeSNc2/G7KARu
         T5ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787909746; x=1788514546;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8+teJGumSEtzE5yE/4xiLp6Nr2szYZ1P4IJfEUhRobY=;
        b=hkt27rKHA+U+Q1b6StqFDcnkZrzxpE0pq500FKOtpuKLk07YKw/IYCbd0shV2etTNH
         Pm+F4E/C+PfFSKsJfjRMLMrcmKu8ym09aSaw5lMARp6apzq9c2Tl7LTt2uQ2YQprNC3Y
         VYCaIe0/4eJYgj6INlBWRXffIaIRcXTgbtM+kvWahbfLTUTNUby2x+lnE0v2bVxawJEZ
         uDaIptkX3nu1j3oAnKyx/hdcjsTkD0bf8PK4TbHPHsotb2OOEbkxnCCixTRzMxRbWPZm
         sUaHa1WG1RYmk2kTUQ/AM3cMLW82TcAORBF5wilJ0RE/lesCrK7xN7llgZNgD9YaNvU+
         Ztag==
X-Forwarded-Encrypted: i=1; AHgh+RqjIqdelZF/zL9QC17/gleTQ9rfOjKI1dih3hf2k7I4tQyVAUf2+2/LFSLagiwRPSKB2GUo6yaPSr3N7/Fkg7I+wA==@vger.kernel.org
X-Gm-Message-State: AFuF++kNA06pbdJTo5fk3Ie8T7VsSXD3dllXX9a4DFeB/q5UHyyltXP1
	y38HXTS5ZrD6LXAW0Umx9xD5V5IZ8V+S8MUBwbRytRmhG+C8Z3NZIer5
X-Gm-Gg: AR+sD13X6vA0++xgNUFrmX+8l/P6/QsqZJVAsFOcGDTIWj/aXNw27Gfk4M+OhljC6A3
	mqH1qIT+WZWaVSMSzVxzp9ZDhmdbFFhAmsTPnM8bWYyjde5Lv5Do5+5tURkBM7VKUXjnlCuGxe3
	Pls1A/P5DfX+Blfl43WwM1GCRpH4VeEG/5n7f8wU8+gFbpH8nbm/DOBIYWM14D/VJn0EfFBRnqY
	rGRzqc8WVJ4LwOE4xYFqsjh+uO6TimPxWsxvn3pJLUqGtCvcLMqBEyl3qeJ2lZfbBv36InQWc6b
	i+XnZKyGBF+5ZbZmwzN9NvbLM30gehR3jOoe7yJLLwIXKwaVSyxd2yp/K7Yxhxw4OiBXQD3lfCW
	mXaK3z66fytB6l/UtvgZhXK+nvMp8aeQ0BTN0cN58N375Piu6LZSxLjqiXGHpf0sY43vcYPh2+G
	09OatWEUY/Rzp/hiWVIG2PhrhqGDrOBN7XZXgh8qae1VxjNIgXDoofbcfLziE4OFQpM9z9gAGuO
	fzR2ZGjJN6U7gKiih1zPgpn8zzP8mrbVRjplPvZMoODip6uhxzj/3kDnLRGqwDCv9WzDKuqqGW+
	XS+HLCfzd0KfON8dkFLoJQECy2lOs+wK8fmWxSddPTkEZeb/4QlhSVxdUJDVWYHwqjTWuWtPsLX
	dbWQPudFuJpeV6N8hjRPJQMfnbctdNxNl8D0pJtRObxPpI9R/h45fWpNOniifcV6dQ7FGE7Dv5y
	a+2MAX
X-Received: by 2002:a05:600c:4fc5:b0:49b:72e4:6223 with SMTP id 5b1f17b1804b1-49b91c2bcddmr63229085e9.7.1787909745986;
        Fri, 28 Aug 2026 02:35:45 -0700 (PDT)
Received: from localhost (90-182-112-124.rcp.o2.cz. [90.182.112.124])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482fbb284cbsm2800194f8f.30.2026.08.28.02.35.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 02:35:45 -0700 (PDT)
Date: Fri, 28 Aug 2026 11:35:44 +0200
From: Joshua Crofts <joshua.crofts1@gmail.com>
To: "Li Youhong" <dayou5941@163.com>
Cc: biju.das.jz@bp.renesas.com, wbg@kernel.org, linux-iio@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, Li Youhong <liyouhong@kylinos.cn>
Subject: Re: [PATCH] counter: rz-mtu3-cnt: check clk_prepare_enable() return
 value
Message-ID: <20260828113544.00000aa4@gmail.com>
In-Reply-To: <20260828071123.179670-1-dayou5941@163.com>
References: <20260828071123.179670-1-dayou5941@163.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 28 Aug 2026 15:11:23 +0800
"Li Youhong" <dayou5941@163.com> wrote:

> From: Li Youhong <liyouhong@kylinos.cn>
> 
> The driver ignored clk_prepare_enable() failures during probe and
> runtime resume.  Propagate the error so probe does not continue with
> the clock disabled and resume does not report success falsely.
> 
> Signed-off-by: Li Youhong <liyouhong@kylinos.cn>
> ---
>  drivers/counter/rz-mtu3-cnt.c | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/counter/rz-mtu3-cnt.c b/drivers/counter/rz-mtu3-cnt.c
> index 7bfb6979193c..6f746cf598c0 100644
> --- a/drivers/counter/rz-mtu3-cnt.c
> +++ b/drivers/counter/rz-mtu3-cnt.c
> @@ -817,9 +817,7 @@ static int rz_mtu3_cnt_pm_runtime_resume(struct device *dev)
>  {
>  	struct clk *const clk = dev_get_drvdata(dev);
>  
> -	clk_prepare_enable(clk);
> -
> -	return 0;
> +	return clk_prepare_enable(clk);
>  }
>  
>  static DEFINE_RUNTIME_DEV_PM_OPS(rz_mtu3_cnt_pm_ops,
> @@ -861,7 +859,10 @@ static int rz_mtu3_cnt_probe(struct platform_device *pdev)
>  
>  	mutex_init(&priv->lock);
>  	platform_set_drvdata(pdev, priv->clk);
> -	clk_prepare_enable(priv->clk);
> +	ret = clk_prepare_enable(priv->clk);
> +	if (ret)
> +		return ret;
> +
>  	pm_runtime_set_active(&pdev->dev);
>  	pm_runtime_enable(&pdev->dev);
>  	ret = devm_add_action_or_reset(&pdev->dev, rz_mtu3_cnt_pm_disable, dev);

This is fine, but any pm_runtime_get*() function called in this driver
would return a negative error code if clk_prepare_enable() fails. You
should definitely add checks whether any pm_runtime_get*() functions
succeeded, otherwise subsequent reads/writes will produce garbage.

-- 
Kind regards,
Joshua Crofts
