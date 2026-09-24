Received: from mail-vs2-f42.google.com (mail-vs2-f42.google.com [74.125.227.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C28F47CA71
	for <linux-renesas-soc@vger.kernel.org>; Thu, 24 Sep 2026 13:09:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790255362; cv=none; b=a0+cN1RFuTe0OEg2dQnrdrwWcIUWPpSLeDj3jO6wGBL+Q0pyqoafjKSyqqMo1LqvEpeURbkDrDtj1HDwWa/69yqKtCmBibgicoGImp2DAr8s8BM1oxXiCkf9dsiEx+IzRVgqX39rvNmbS8nM0ybnJnz+AEz5XQ94x1LpBWkvvOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790255362; c=relaxed/simple;
	bh=Rw7n8PAoUz541AnGpQ4DaMj5urjCrlERBFASJKmrTpQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KvwI7cuJ2e+wifPseu4T/IVO/jKA+AMsTREXrAWkslLWxGk2lhyaqibNNznOFpNA1vkMVe3WPutPmfLyKLzIpQc3eoUIAHkw+/fGQRc8simQFxGhVU4rXNFf0yaJbTiffFgzPoCe8stJ9EwEnl7ghw8zaeENjfMT/SQg4WSxyF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.227.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs2-f42.google.com with SMTP id 71dfb90a1353d-5c963d7503fso791280e0c.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 24 Sep 2026 06:09:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790255359; x=1790860159;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=iG1Qpl4QN7ROIqBz9RYanLV8CcyoC4MV5Wut2AruDjg=;
        b=E4G9pkTKQCoXNPnvvIBw/1ErqLIrwPOG2O8JxP0auRBvUUUshuTZb4VOQc5uSmB6s0
         N0UpKoLfBUjPtJ5hoF+/meBzcIfHvsHtTNBlnujHaG9d/ix+dy8hsNuc2REMb2Y03HZH
         WXBlriIxB1x6gBXYjuZsKsqVRZKDMLmXCefcYPK3sbjGhC7miigPc+QA+P3lDSZRWIqb
         +3stdBsUNzH56aMeE/MMO5LLBLtUPgkLAuZBIGfGZH18OgZ3c0Gyep363SNVmyL2fVvk
         mJQ0Wo9wkHNMw9qtSdqRoKburdNg0lD1pDoYJBo79l8Riyv8hMzLNhJqUo8NbuIUHw+/
         KxIA==
X-Forwarded-Encrypted: i=1; AKwUvByt+0Sv0wVssZb2DtNHw9f0bxA4djbxdpS/G8gmt4UIzx6tVvRupRPIfNo1RB4YKwTEmxVCrXCdXbhdWBUbM4rKeg==@vger.kernel.org
X-Gm-Message-State: AFuF++mrd84VoWtZswjC3pA6KIg/Dic5E0RvrQZnrfztEx357tywbQh1
	Scq8mzkStQkw6ySgVSSaPP1e9iZwJaG+TySpxKy48NO0aAQPhDztnxnXs/JDfj3W
X-Gm-Gg: AYBFou3ruiUgCipFUuEiDqGRTXM+ZNY9yboj8FhpEyQE0KSwMKSYz/iO5U/dRBKghRB
	Kk7LOeNt08bIFYZ96Bnvhm7uFbK4uoLZsAOsVDzeS7tU0OvSRv1aMVujfC+tcTIeNDbQc6gWZou
	GbNc5svTIFCrjCe6JdvEDsweKBh67qgEdHWXLwYRWE1XDr4uDsaJG+aKYTWN4+Z808jPJ3iLqYB
	tr4xT2/g1zPzCn/T8gJI63m7NuC1vPbklXvUtdaI3+/3LbEN9R+iFHcNEF+pUC7CZzt3hnPdkVM
	W3H7YfOmJjrgF5LIz8Et7bevtryL9T1afCBfpRFiDycia+K5MvbNed44BVF5zGYb+C/OYWZvOJw
	sHkdiBqvcLWKoTSxSX4N9g1SRacTqHP3obJ2q4fxxDRPrvggroXzMFRMGnT9ECOrlQaimVereiU
	fDSeBFvhmbsJVgBZZQxbAhXvwgIqFEC+0ePF5ypXCOVDtjkBARohKn4pd9IjZ1m4pD3BL8h0ZX6
	8L/W+3tm0Gq4YmsHEFeOwwpwhakYxtK1lo55zArBZYb7k8=
X-Received: by 2002:a05:6122:218d:b0:5bd:b2e1:e1f5 with SMTP id 71dfb90a1353d-5cb09121fd6mr1405156e0c.2.1790255359183;
        Thu, 24 Sep 2026 06:09:19 -0700 (PDT)
Received: from mail-vs2-f12.google.com (mail-vs2-f12.google.com. [74.125.227.12])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ca4604daf9sm4602909e0c.17.2026.09.24.06.09.18
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Sep 2026 06:09:18 -0700 (PDT)
Received: by mail-vs2-f12.google.com with SMTP id 71dfb90a1353d-5c67e5292faso902054e0c.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 24 Sep 2026 06:09:18 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBx/nR9fkVp8q0NcP3ROs6wY0hZz2nPIgN27aCrSwnpw+Uw/9PPAK0G2JqRCkkkpusvseDKUmsuA2GVqAy7wHofKHw==@vger.kernel.org
X-Received: by 2002:a05:6102:291e:b0:7af:51a:de01 with SMTP id
 ada2fe7eead31-7af1d4bd641mr1095503137.19.1790255357883; Thu, 24 Sep 2026
 06:09:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260924052741.130658-1-biju.das.jz@bp.renesas.com> <20260924052741.130658-3-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260924052741.130658-3-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 24 Sep 2026 15:09:06 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUd7=y6H+GP_7eOHSc0Ye0ZB6CgKUvmFrWMsVAK2SW6RQ@mail.gmail.com>
X-Gm-Features: AclHuK9dW-prLzuGnv2Aohs4SaGLbmejrymX0wYt9Hgm6hDrfeTdOyUn1vibBgc
Message-ID: <CAMuHMdUd7=y6H+GP_7eOHSc0Ye0ZB6CgKUvmFrWMsVAK2SW6RQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] can: rcar_canfd: Derive max_channels from the
 device tree
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Marc Kleine-Budde <mkl@pengutronix.de>, Vincent Mailhol <mailhol@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Tu Nguyen <tu.nguyen.xg@renesas.com>, linux-can@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, 
	Chris Paterson <Chris.Paterson2@renesas.com>, Biju Das <biju.das@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Biju,

On Thu, 24 Sept 2026 at 07:28, Biju Das <biju.das.jz@bp.renesas.com> wrote:
> The maximum number of channels is currently hardcoded per SoC in
> struct rcar_canfd_hw_info. Since the DT describes the channels as
> child nodes of the controller, the count can be obtained at probe time
> with of_get_child_count() instead.
>
> Drop max_channels from struct rcar_canfd_hw_info and store the value
> in struct rcar_canfd_global, so it no longer needs to be maintained
> for each SoC variant. Update all for_each_set_bit() users over
> channels_mask to use gpriv->max_channels.
>
> No functional change.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Thanks for your patch!

> --- a/drivers/net/can/rcar/rcar_canfd.c
> +++ b/drivers/net/can/rcar/rcar_canfd.c
> @@ -2145,14 +2139,16 @@ static int rcar_canfd_probe(struct platform_device *pdev)
>         bool fdmode = true;                     /* CAN FD only mode - default */
>         char name[9] = "channelX";
>         u32 ch, fcan_freq;
> +       u8 max_channels;
>         int i;
>
>         info = of_device_get_match_data(dev);
> +       max_channels = of_get_child_count(dev->of_node);

This value really needs to be checked against or capped at
RCANFD_NUM_CHANNELS, to avoid overrunning the fixed-size
rcar_canfd_global.ch[] and transceivers[] arrays.

>
>         if (of_property_read_bool(dev->of_node, "renesas,no-can-fd"))
>                 fdmode = false;                 /* Classical CAN only mode */
>
> -       for (i = 0; i < info->max_channels; ++i) {
> +       for (i = 0; i < max_channels; ++i) {
>                 name[7] = '0' + i;
>                 of_child = of_get_available_child_by_name(dev->of_node, name);
>                 if (of_child) {

The rest LGTM.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
