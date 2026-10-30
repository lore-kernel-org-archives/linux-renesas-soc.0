Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.43
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793370982;
	b=XJ/CtbNWEvFiKfrPA8cN0RO+fPBgN8AUVPEc4YtzSJ9SQk9mzy7oGfaZaTlhfWBP7dQF
	 ihyrl6YcgV0PYTs5Orrp8xq7zQ4pzKWDaXEWYddlgx2WgKRTYGTCqDQnmaMXRorPKtIPx
	 WpKN+u1abzBTH2VixqQPfgBt1y3tqznlAS6h6pa2MOP53FldGFtGp7ydogHZhNcUS43E5
	 DeW7IDa+Lbr4DRiFrMRsJUG4v2FJJkhyItPz8OV3NM9Olp9hdS2lXI230NIfKQmcucKzK
	 volyb4fQNLRJbSJZIJFndmLFONSD8jwrZ9dhdnTIxutdqBfPLpjHMBRe358qZI/iQGg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793370982;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=J4apMJBTp7WdrBg4suFHTn5q3Lrcb7dvdWPvcbdMeiQ=;
	b=JcNKeDJTmYNWkeV1AjS3mUhfttuAg5DWdqYvhUZxT8EDFujefwZhsOGSh/MwYp1AEYPY
	 EeCEUqzaJ+uossfjcENl7NDLcgs07Vrw75zunzdI/SogBW/hL4SDvRAWCHIvW329yVRSU
	 5LbCGkRr9rlENPTrvqDpk/GTa/qj8KI8DX2PO/ew/tCR3KD9qJSV8dlNdfBGPWpe0Spr2
	 eWcxdW39r4ka8PIHVUw95L7tg2nUtLeoPeATkUZcfqUkFdsYY7QrbcUvB6dOTNH13/o7+
	 cCTEYPre/E/usQVSQA61dRvvwst3p8anJbMpU1CqR+Oi7tdF3FWvDjaZWf818Qe0duA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ndvex3Bl;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.43
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5E53606A31D
	for <linux-renesas-soc@vger.kernel.org>; Fri, 30 Oct 2026 14:36:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E5E53606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ndvex3Bl
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-6b1ab2ad719so1022599a12.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 30 Oct 2026 07:36:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793370980; cv=none;
        d=google.com; s=arc-20260327;
        b=ZbceX0C0Ra64cKS0HfvLblw587NFYxv8UNqgWtf795G/pxIv0QYReImNUmLhNjXjSq
         O2uT4pnE63WZrAvjWknxJfshO6/DNI4F40/QxU52g8uA8zouCtT9H34qpj4EF/++HGHa
         J477c7fWBW0AKbY+cxBeGV8IbWOe/sdSv64Iw6jEYQVUvhCS1KZA3OSXRNA/ayHzXuxX
         j5g2bLWk5C6X1DcAPKpCNbsFqdqLrxa37QXXi7As3Or0tJh7GO6Dvu7Gool0uBZE2adL
         fpNdAI7YdR6idH0nqTtX6PgW+51VYejhtqpz1FNsPClRTkgrEVcHQZCrBKfZCR6MGxLt
         JTkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=J4apMJBTp7WdrBg4suFHTn5q3Lrcb7dvdWPvcbdMeiQ=;
        fh=oUfLFIGjZySR4KnVgZKVy28oJtNKFCNPAlewOD7b6z0=;
        b=VfZ9FkQUwEZj35JrJMabP8uOcQcRqulxyQmfPZl+rpmPbooEXZVX8dz+FQCYpZ7V84
         nhl2DMq9BwhMeiWFpNFFU5ClgCyIbJGWArm9ukNnfoklP8OhSio+E2k6qLMJq2n5Rxx+
         eP0Lvhs8HAAn26nhhiJ7O0yMLWjw9ZZi2guEfrPBSvoyNj2nKN4gNhfWpiH2UgC6sbC1
         7H3YX8mmz998+aF6tYsokO+iSbWIQNDMhOlUE5KnNI1ZMGnmfuZUvbmRO93p+3aZR4CZ
         6BCiUjJ8LbneKUBw2tGRjVet3eyH0qfZMYwsA2koWKuKjC89hj2nCzvk4OuTUqOjbsbv
         YMqg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793370980; x=1793975780; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=J4apMJBTp7WdrBg4suFHTn5q3Lrcb7dvdWPvcbdMeiQ=;
        b=Ndvex3BltjFehYl2G/oYONTnTGU07HrztEr9qfUelrnSpHWiZOSm0EfDP5jwqYFkt5
         WzdoGX794XnJj3asgrPtaZeHxeEYaFG7iKK/dQbS9224lVfcGRHhOGY6fgDCZei6XLtW
         GjPUulLx5r07+pyU6XXso4uGPi8GYTy8P+iZm6pwYEFdYBfgTFmqMqwd/y25Ml5dbGUb
         /rkPGKDj0iXaFvS179wVOXovmjIgWMK8sv0lR5cCY3ni1dF5b1q2+drGoFqhLHqt2gle
         Pf/fUBH6Jow5RC5NnGvfDBhk9F0TWkJqdNmGgbSFAOgfB5oJIHvLRgRqY7b9zEHfRkZW
         AYeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793370980; x=1793975780;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=J4apMJBTp7WdrBg4suFHTn5q3Lrcb7dvdWPvcbdMeiQ=;
        b=pXOb+EuMJ+rwc27UV6nHJOsEeHkkdLDygXCs408xKyDDmhPyT23CRzDrXqkso3ZY9X
         zVbdfykBt9z7roYc0c0nubi/LB0ghyWCNtjqzG05O4W3EQxr1Maw79D5GX/coozef4yO
         Ppc8ePoBnB5PUBZC5GyMLuKVn1jxi0PNId9Dl/c5DrfJ0wuorUYhgimpsLwGE02gOtGi
         touA9JJxCAESNsqK5Mb48NOgYJM07e8aiZcUvVrUfFrVqm5Me0bRwwtGtBKDnpCbFTa7
         qLDXfoTDvVCDQR7Wj/ryROoOn1TVbacHHd1NW3LxPEqMeB7Cl9P0gJ6E9Q1c7WOtvKdH
         RFDg==
X-Forwarded-Encrypted: i=1; AKwUvBywlHBxRUKWxFXDcQuVkFjDpbEOWBbv4X1jLrCwx/1flkEo+1qN8bFXX4DPfmZpm5F8uyLhAf7fKxWXEDs3nHloTg==@vger.kernel.org
X-Gm-Message-State: AFq9FYKxzigssJOrZ4AjPakSYZf2Jl4aSrb6ikGU8kUYAFfIKmsIeTzI
	NArZEjAzaaGdRwgRpuq63QVC99GVblLzSY8YQCHfpJ10Rtzz1IQDGj4MQWIeZMvjUU+lyesvcWw
	XCpl3ahOjZIMJEqumwJ4YP3XD8KvCR/g=
X-Gm-Gg: AYBFou0SNTqI1bxpvWlM+iqXiVdqRjtHkSfWY8SLlQGew7eWidVNZfRllDfeUnxY5ZL
	GtZzvM6KK/5UFwkEwMj5rsGHI36s66dauYbkHKyyobfgSoPfskCZELcvNgQ7Xp+Xb2Iq38j7+HS
	TC3Asz8DdBbn19IBS698nr/3FXnmHJs+aKO4u3On2Fit0Z/Gs7uW5HI91Fl0m2xXIv/4t24FKwI
	FWQMLTRrmr0yiJ0XJ63Qw9idcrbUS+m/JmTBlA9FCgDJ1SPL7lL1xNgLiBFFn4Ga7zRxBFuLHYR
	5jrpLwwTtkJLRKCup49PShCzyHqnSZkdIsn1cvLLiKr7H/yJaXDEg+go+ZZRCwbRB9tDdUtVtiL
	yjEwRijJmwHtmoGxovR4ZDzFGdJezeElpOzU7fwQ2g36pap6zL4Qo/+i620Aem+i7FJXSF8c=
X-Received: by 2002:a05:6402:322:b0:6b3:b7bf:ac53 with SMTP id
 4fb4d7f45d1cf-6b4d33c6adamr1283454a12.4.1793370980086; Fri, 30 Oct 2026
 07:36:20 -0700 (PDT)
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Post: <mailto:linux-renesas-soc@vger.kernel.org>
List-Help: <mailto:linux-renesas-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-renesas-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261030143151.2916788-1-codex@local.invalid>
In-Reply-To: <20261030143151.2916788-1-codex@local.invalid>
From: Samarth Narang <samarth.colleges@gmail.com>
Date: Fri, 30 Oct 2026 10:36:08 -0400
X-Gm-Features: AclHuK_uFaRH3rHXTBPe7XlybWVryPD5O6NwDMdPcOAxOE20GZyoJyLrqAWMhsc
Message-ID: <CAAbz3fQReXcfPVHnTo6DkjUdMxYcjQVU2iOoZVFYzuv56FoKCQ@mail.gmail.com>
Subject: Re: [PATCH] mmc: sh_mmcif: unmap DMA buffers only after the transfer
 has stopped
To: Ulf Hansson <ulfh@kernel.org>
Cc: linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Sorry, the sender header on this mail came from a misconfigured local
git identity. I can do a patch resend if required.

Best,
Samarth


On Fri, Oct 30, 2026 at 10:31=E2=80=AFAM Codex <samarth.colleges@gmail.com>=
 wrote:
>
> From: Samarth Narang <samarth.colleges@gmail.com>
>
> When sh_mmcif_end_cmd() is woken by a data error interrupt or a DMA
> timeout, the DMA descriptor may still be active. However, the function
> unmaps data->sg before clearing BUF_ACC_DMAREN/DMAWEN and calling
> dmaengine_terminate_sync(), potentially releasing the mapping while the
> controller is still accessing it.
>
> Since data errors can be triggered by the card, a faulty or malicious
> card may cause DMA accesses to continue after unmapping, potentially
> affecting reused IOVA or SWIOTLB mappings or causing premature cache
> maintenance on non-coherent systems.
>
> Move the unmap after DMA termination so that the mapping remains valid
> until the transfer has either completed normally or been terminated
> synchronously.
>
> Fixes: eae309836509 ("mmc: sh_mmcif: Terminate DMA transactions when dete=
cting timeout or error")
> Assisted-by: LLM
> Signed-off-by: Samarth Narang <samarth.colleges@gmail.com>
> ---
> This issue was identified through static analysis of DMA lifecycle
> ordering and has not been validated on hardware.
>
> Since the request pages are not released until mmc_request_done() is
> called after DMA termination, direct-mapped pages remain owned by the
> request. The potential exposure is therefore limited to the DMA mapping
> layer, including IOVA or SWIOTLB slot reuse and premature cache
> maintenance on non-coherent systems.
>
> The fix also relies on dmaengine_terminate_sync() stopping the channel
> correctly on both MMCIF DMA providers. However, shdma clears CHCR.DE
> without confirming that the channel has stopped, while rcar-dmac polls
> the bit for approximately 1 ms but only logs a timeout if it remains
> set.
>
>  drivers/mmc/host/sh_mmcif.c |   23 ++++++++++++++---------
>  1 file changed, 14 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/mmc/host/sh_mmcif.c b/drivers/mmc/host/sh_mmcif.c
> index 8bd9cdeda..7b33f832b 100644
> --- a/drivers/mmc/host/sh_mmcif.c
> +++ b/drivers/mmc/host/sh_mmcif.c
> @@ -1173,15 +1173,6 @@ static bool sh_mmcif_end_cmd(struct sh_mmcif_host =
*host)
>         time =3D wait_for_completion_interruptible_timeout(&host->dma_com=
plete,
>                                                          host->timeout);
>
> -       if (data->flags & MMC_DATA_READ)
> -               dma_unmap_sg(host->chan_rx->device->dev,
> -                            data->sg, data->sg_len,
> -                            DMA_FROM_DEVICE);
> -       else
> -               dma_unmap_sg(host->chan_tx->device->dev,
> -                            data->sg, data->sg_len,
> -                            DMA_TO_DEVICE);
> -
>         if (host->sd_error) {
>                 dev_err(host->mmc->parent,
>                         "Error IRQ while waiting for DMA completion!\n");
> @@ -1208,6 +1199,20 @@ static bool sh_mmcif_end_cmd(struct sh_mmcif_host =
*host)
>                         dmaengine_terminate_sync(host->chan_tx);
>         }
>
> +       /*
> +        * An error IRQ or a timeout wakes us up while the DMA transfer m=
ay
> +        * still be running: only unmap once it has completed or been
> +        * terminated above.
> +        */
> +       if (data->flags & MMC_DATA_READ)
> +               dma_unmap_sg(host->chan_rx->device->dev,
> +                            data->sg, data->sg_len,
> +                            DMA_FROM_DEVICE);
> +       else
> +               dma_unmap_sg(host->chan_tx->device->dev,
> +                            data->sg, data->sg_len,
> +                            DMA_TO_DEVICE);
> +
>         return false;
>  }
>
>
> base-commit: 24a19b953e2a3d0ea5a8c4951a0ab8f32720c907
