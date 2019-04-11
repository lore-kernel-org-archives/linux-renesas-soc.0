Return-Path: <SRS0=kcdn=SN=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4AB3C10F13
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 11 Apr 2019 15:25:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 8AB6E2083E
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 11 Apr 2019 15:25:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech-se.20150623.gappssmtp.com header.i=@ragnatech-se.20150623.gappssmtp.com header.b="AutrqMRl"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726073AbfDKPZO (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Thu, 11 Apr 2019 11:25:14 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:39207 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726391AbfDKPZN (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 11 Apr 2019 11:25:13 -0400
Received: by mail-lj1-f194.google.com with SMTP id l7so5912012ljg.6
        for <linux-renesas-soc@vger.kernel.org>; Thu, 11 Apr 2019 08:25:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=wDDH2wEtncLLXPiUO3GB++3thmlGHU5jUj+dEC4OZoM=;
        b=AutrqMRluE7eCxjBQpZoNd7VUrBE2ckNrdeZPR9MlkWKWoTykvNfhO1C2X4qluFn/I
         c11lIITAcydZeb22Sy5zA2VYH/oB8t02RfB2r4FS6BC21ZfhFWIkuPSqFBKdlASc7vHX
         ca7XJ6KAMuZTNH3xj0UeKQsXYUgSB74GczYrIaAcF2OIPXtn2xOY0LwLQghOknccwmvx
         cI37EzEm4iwW7TPGwPks9z7OOefemCCAxsj3l02ZUcQe8p+yy3pQRG5t2t5DQD1P6KqS
         tOj9Iq5JsonLNNA5NgDsedbEEwa3DsvPT7w7j/6Iv2GTDPX9BH+45sJnhSzfPzHkUOoQ
         ymXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=wDDH2wEtncLLXPiUO3GB++3thmlGHU5jUj+dEC4OZoM=;
        b=L1RyYb2ERO8zejU6D2Lncq94tWIWx5kmzSNOSyblBZXYrb8M6SsHyaIuGgBTj4O+z7
         cYhqlwr0+bIYanXxNvKuIT9rf2kDyXC6ZJERzm/++ysDG5cc4VFu0eTlI4ZZeiIiOXQK
         MaTRkSluKzIR1zliQlNY1yD5Jp6qc5Obnk7yzrMCLb8sVtHMhFl3F9cPm9aryvvBITP9
         nVW6KfgkXJhgCmLROyZVzWOoohzC3AVKU/poFqa8zCrnEsn2CauTsSkdf+6zQSKLVwPh
         cT/ecCbOqBcy4WfW0r+WEOArg1sGOTpx7ME4xwnucSoFQsYXspLs4YSq0BazNUJN7cZU
         UnAQ==
X-Gm-Message-State: APjAAAWQfXFmaJj0SrZNo32SMSFEvhBjOnLo2tUqbmf/wbhPZz2UUKgu
        IN8k6VxCrZV5WE5klLZ6uwnG2g==
X-Google-Smtp-Source: APXvYqz0oxVt5MtSOtaDCAF6QHm9FVIQgAgi5CNjruUitBAdhoXe+FM/QJApBpL0oolJVgQCsMrDww==
X-Received: by 2002:a2e:7215:: with SMTP id n21mr28469508ljc.105.1554996311965;
        Thu, 11 Apr 2019 08:25:11 -0700 (PDT)
Received: from localhost (89-233-230-99.cust.bredband2.com. [89.233.230.99])
        by smtp.gmail.com with ESMTPSA id c5sm8545308ljd.18.2019.04.11.08.25.10
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 11 Apr 2019 08:25:10 -0700 (PDT)
Date:   Thu, 11 Apr 2019 17:25:10 +0200
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>
To:     Cao Van Dong <cv-dong@jinso.co.jp>
Cc:     linux-renesas-soc@vger.kernel.org, broonie@kernel.org,
        geert+renesas@glider.be, horms+renesas@verge.net.au,
        devicetree@vger.kernel.org, biju.das@bp.renesas.com,
        yoshihiro.shimoda.uh@renesas.com, kuninori.morimoto.gx@renesas.com,
        h-inayoshi@jinso.co.jp, nv-dung@jinso.co.jp, na-hoan@jinso.co.jp
Subject: Re: [PATCH v2 00/20] Add more support to the RZ/G1C (r8a77470) SoC
Message-ID: <20190411152510.GD30887@bigcity.dyn.berto.se>
References: <1554969262-15028-1-git-send-email-cv-dong@jinso.co.jp>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1554969262-15028-1-git-send-email-cv-dong@jinso.co.jp>
User-Agent: Mutt/1.11.3 (2019-02-01)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Cao,

On 2019-04-11 16:54:02 +0900, Cao Van Dong wrote:
> Dear everyone,
> 
> This series adds HSCIF,MSIOF,PWM,CAN,VIN,Audio,Audio-DMAC,Ether,VSP,FDP1,LVDS support 
> for the RZ/G1C (r8a77470) SoC. It is based on the renesas-drivers-2019-04-02-v5.1-rc3 tag 
> of renesas-drivers tree. Currently, I only add patches to the tree and compiled. 
> Unfortunately, RZ/G1C board is not available, so I have not tested these patches on this board yet.
> 
> cc Biju,
> I know it is very difficult. however I still want to ask if you can help me test them?
> If possible, I will send the .dts file separately to you.
> Because I am known you can be available this board. Thanks!
> 
> Cao Van Dong (20):
>   ARM: dts: r8a77470: Add HSCIF support
>   ARM: dts: r8a77470: Add MSIOF support
>   ARM: dts: r8a77470: Add PWM support
>   ARM: dts: r8a77470: Add CAN support
>   ARM: dts: r8a77470: Add VIN support

The changes for VIN looks OK but as Chris points out it would be nice if 
they could be tested.

>   ARM: dts: r8a77470: Add Audio support
>   ARM: dts: r8a77470: Add Audio-DMAC support
>   ARM: dts: r8a77470: Add Ether support
>   ARM: dts: r8a77470: Add VSP support
>   ARM: dts: r8a77470: Add FDP1 support
>   ARM: dts: r8a77470: Add LVDS support
>   ARM: dts: r8a77470: Add audio clocks
>   ARM: dts: r8a77470: Add can clocks
>   dt-bindings: display: renesas: lvds: Add r8a77470 support
>   media: dt-bindings: media: rcar_vin: Document r8a77470 bindings
>   ASoC: rsnd: Document r8a77470 bindings
>   dt-bindings: pwm: Document r8a77470 bindings
>   sh_eth: Document r8a77470 bindings
>   spi: sh-msiof: Document r8a77470 bindings
>   dt-bindings: can: rcar_can: Document r8a77470 bindings

Nit-pick: I would first add the bindings to the documentation and then 
to the dts files.

> 
>  .../bindings/display/bridge/renesas,lvds.txt       |   1 +
>  .../devicetree/bindings/media/rcar_vin.txt         |   1 +
>  .../devicetree/bindings/net/can/rcar_can.txt       |   1 +
>  Documentation/devicetree/bindings/net/sh_eth.txt   |   1 +
>  .../devicetree/bindings/pwm/renesas,pwm-rcar.txt   |   1 +
>  .../devicetree/bindings/sound/renesas,rsnd.txt     |   1 +
>  Documentation/devicetree/bindings/spi/sh-msiof.txt |   1 +
>  arch/arm/boot/dts/r8a77470.dtsi                    | 608 +++++++++++++++++++++
>  drivers/gpu/drm/rcar-du/rcar_lvds.c                |   1 +
>  9 files changed, 616 insertions(+)
> 
> -- 
> 2.7.4
> 

-- 
Regards,
Niklas Söderlund
