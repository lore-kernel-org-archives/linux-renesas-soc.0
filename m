Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com [209.85.217.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9A523F8257
	for <linux-renesas-soc@vger.kernel.org>; Thu,  3 Sep 2026 09:43:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788428599; cv=none; b=rqBkkG63kX4lDXOQztqlP7lnZlsqvTN2jlQbYoeM5qI4zOxcuhQQuxw1E+NrFDBbclILcNFb0FwResDVPgACQQICzHTeEqLAk/IBDA4mpgRFJq2K59kVQuo2/q/6Nd9BzufMN9JuFnt4tib3YV2i41360BonponmICclnnIL1zM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788428599; c=relaxed/simple;
	bh=QlpCUlv+E6wRy2NB52jPmYtg/gL7xxiavKZ+fWvKSsM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hZOi0ynhKZ5BFO7Z83OKiH8v8xPTfGG0OfSQEqBuB2scee3edvNR4oP6NMvnJz7n79cXBrfAsXJ6xNNpq6Mzawly4Z0T7cYXS4h4VFFPuk9JBkkGsQujDtIta1cxY29JwQuIN5w/QcXYjjyYYXCYMRjXqeQ2uqE/DGERpe15XX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-782df51b4c1so1512672137.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 03 Sep 2026 02:43:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788428596; x=1789033396;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=/8aSggrTq+PN9vIOxwXLgYslllD/sPjeAKVtCCSsPVQ=;
        b=eHEf8ly76Qk2pOKZ0VNGraBT9KJPSGxtaWU7VrH6tU5XjEeQgtcXCEUMyB2iTFCXDm
         5YzX/H0dy4nvBHvXClrqbBvGsedgGDdJePxtTaAYHo/4wy6m8REtQ+OLavliVaKm06Ra
         FiawGQU4lxIeBDlzpadfIhNJIZhRGDTnWv58Xx99igl2uceU9KZ0xkA/lyRiCzRXnmG4
         ikH8u4ntdZSL3WKaG3zIu/BKYFCwaxuydJnfziTCRtKKar0eWTQQm6DknQtnKDxugNmO
         yUfpUWga4GIxi6kgsQ4sNe0CeOlB3V7YDmqznuBUtpPsJ4hNfu9Ey6k7od68hq3Zd3f0
         3u0w==
X-Forwarded-Encrypted: i=1; AKwUvBykozAWG+Gt1Xr26vKrxSzuEHbBUKhYRYnzzBCKAhfT02bOauMrMlmxcTp7VaLEoVz9mFXqaPEDON4rPDaHWq/Kdg==@vger.kernel.org
X-Gm-Message-State: AFuF++lMZWs6Pt2ZkCh54lf7TEPV9MmCFvyevaT2wkAaS76uvznTgxWZ
	S/8IQeUhje2l0eQ0UV8drrvV4NEIdxT0e83lnSxVZKWpx09cKJfwWGawzrSB7tanR+M=
X-Gm-Gg: AYBFou2XzZr6YQqwIlo8ZFGvOGFaCxLQPlCgGfIqhxOpkASHg/FGCrBHb3kBauBg7aH
	xZaFFzLiKjDFrlf5gCnt18T1D6hBm8g8Im4JOUOiuoIz1K4xApBuWx5Pe41hnHm8+jlUYsI1I1C
	ln0qKB4n9WdSvGHg0wXRQjkXzhDHDuHRUW0/XiFy2AqUV2KLFF/r2JoE6yZTSa15IwSbuDXEDJu
	0+mJEQlICxsMPoAtoLhxZciHboqB/ADCrlgHCHgU/Ar23F54dQFzsk0T61hTpeBBnwcJ++M5iE6
	4noM3Rs8hgA3UqBoO7JWgheMr1Hi9n7hsQ8IEtFryHhfS+4eZOFTzs5gEFYaql0WH4pB5hU4uGF
	3NWmRXsr0GwMptR6JijRBZFlMeICdw1IFtBZ8VrMQEmOrk6d+UvJxZbZPTr4B6ZxtBvYBEKdWoM
	+zOtYOhrTPLl8bEAweSCqziHfYXjBlBVgHmZcwvZuHFhzJuaYQ3K7AFz/Wr8ukXpPdTR0jvoiNL
	xUWFbE2eTF/AX8xD4XGurRzlQ==
X-Received: by 2002:a05:6102:158d:b0:77f:7df:ddd2 with SMTP id ada2fe7eead31-78a1f228d73mr4559863137.1.1788428596468;
        Thu, 03 Sep 2026 02:43:16 -0700 (PDT)
Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com. [209.85.217.46])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-9807764dec9sm2043944241.12.2026.09.03.02.43.16
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Sep 2026 02:43:16 -0700 (PDT)
Received: by mail-vs1-f46.google.com with SMTP id ada2fe7eead31-746d77537f8so1358197137.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 03 Sep 2026 02:43:16 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxCWyaruZOm8eK3YFMWwyJr4Vh0ihru4qLk7HCE9z7ivqC6PojA1RoTkcXGPTR0f2YDk9ZnIDCQV9j+9qva/s1nPQ==@vger.kernel.org
X-Received: by 2002:a05:6102:2997:b0:784:a169:194a with SMTP id
 ada2fe7eead31-78a1f437b62mr4757188137.10.1788428595977; Thu, 03 Sep 2026
 02:43:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260903084339.870562-1-zhouruizhe@resnics.com> <20260903084339.870562-14-zhouruizhe@resnics.com>
In-Reply-To: <20260903084339.870562-14-zhouruizhe@resnics.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 3 Sep 2026 11:43:03 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV871ZLtrCzXFmhUeThkc8eFAhcFo2=Cos9iJru3bxvqQ@mail.gmail.com>
X-Gm-Features: AcwNN1VNMZwSAyY54Zj_XBQDARj9cOjn3MGAVS5vnzomKXlBjnTLo99feqtQTjY
Message-ID: <CAMuHMdV871ZLtrCzXFmhUeThkc8eFAhcFo2=Cos9iJru3bxvqQ@mail.gmail.com>
Subject: Re: [PATCH net-next 13/14] net: renesas: rswitch: Remove obsolete
 32-bit DMA mask fallback
To: Ruizhe Zhou <zhouruizhe@resnics.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Ruizhe,

Thanks for your patch!

On Thu, 3 Sept 2026 at 11:27, Ruizhe Zhou <zhouruizhe@resnics.com> wrote:
> The DMA API guarantees support for masks of 32 bits or wider and

Really?

> explicitly identifies retrying a 32-bit mask after a wider request as
> incorrect:
> https://docs.kernel.org/core-api/dma-api-howto.html#dma-addressing-capabilities

AFAIUI, that is only true iff the wider request is DMA_BIT_MASK(64).

> Remove the obsolete fallback while retaining the error check so that a
> genuine DMA setup failure still aborts initialization.

Have you tested this on actual hardware, with/without IOMMU support?

> Signed-off-by: Ruizhe Zhou <zhouruizhe@resnics.com>
> ---
>  drivers/net/ethernet/renesas/rswitch_main.c | 7 ++-----
>  1 file changed, 2 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/net/ethernet/renesas/rswitch_main.c b/drivers/net/ethernet/renesas/rswitch_main.c
> index 755232994fcc..64b821ca02f8 100644
> --- a/drivers/net/ethernet/renesas/rswitch_main.c
> +++ b/drivers/net/ethernet/renesas/rswitch_main.c
> @@ -2162,11 +2162,8 @@ static int renesas_eth_sw_probe(struct platform_device *pdev)
>                 return -ENOMEM;
>
>         ret = dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(40));
> -       if (ret < 0) {
> -               ret = dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(32));
> -               if (ret < 0)
> -                       return ret;
> -       }
> +       if (ret)
> +               return ret;
>
>         priv->gwca.index = AGENT_INDEX_GWCA;
>         priv->gwca.num_queues = min(RSWITCH_NUM_PORTS * NUM_QUEUES_PER_NDEV,

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
