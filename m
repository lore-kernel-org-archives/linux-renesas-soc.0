Return-Path: <SRS0=voFw=X3=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9BEAC35280
	for <linux-renesas-soc@archiver.kernel.org>; Wed,  2 Oct 2019 14:19:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 93EDB21920
	for <linux-renesas-soc@archiver.kernel.org>; Wed,  2 Oct 2019 14:19:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1570025969;
	bh=bRwFv45lZ6WoDxR1iojK7u0K2HtgaEGVQtHHo+Ez8Yg=;
	h=Date:From:Subject:References:In-Reply-To:Cc:Cc:To:List-ID:From;
	b=MkiiOoUl28uTVAb+w0RrjH1SeB2cZwdXcsNp978VWyZt3xyXi+gz4o+D46jkpBya0
	 3g9t10hdbP92Lkc/je7hMcx9GeUDf3KwFIujnl6cEELlwgUkwD6vzt328vh03AhWcV
	 1COQ87QS1CLoh1g4UviJM2GzjRJDSx5cAjVMooiA=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727591AbfJBOT2 (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 2 Oct 2019 10:19:28 -0400
Received: from mail-qt1-f195.google.com ([209.85.160.195]:34481 "EHLO
        mail-qt1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728231AbfJBOT1 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 2 Oct 2019 10:19:27 -0400
Received: by mail-qt1-f195.google.com with SMTP id 3so26578370qta.1;
        Wed, 02 Oct 2019 07:19:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:from:subject:references
         :in-reply-to:cc:cc:to;
        bh=6K7h81n5R+8N5AYxLG2UrQyGpz0OM8kQJKC93Y2B28Y=;
        b=PubIfMPGPixET196Kg04etocm/lJ+emIpJ91Qk54sc84xbYBLOZvIkqTxT3grusx/Q
         eOsb8L4nnomfylt83b4Lb4bznTGhSj5uAIDYab8wDO6PQTPO8wUFLSrWyxE8hl/SjyHp
         Mh31iK3llAoPyJzaxIcwq2WGT3f31l9KxBWx1Dk+xDjJT2LLp6qCCPzyKDGPZWXtfYuq
         9jpHLrUrQOB6HdNLnEy7Xxz9fSqiJTRDTnsXlKZnt8xE1ktDCSLCzq5XMRZYPjgLHwEP
         sKpDb4xfE9WIv9AoOzbhgoK1ByTQhaocRPfvzgtTyV23CO9PFitYh4yJjJ8WH/CHcrfT
         WD5Q==
X-Gm-Message-State: APjAAAXjl1Tire55+L5c4bLmkz5sr5rABFu0NzbrHjkiXkx1aQW3FhX6
        4x74ApS3e7r8uOt/9li93A==
X-Google-Smtp-Source: APXvYqyEow9CPhTFiohWRgy15ugJtNjrfTTlldI+woJBQ5VtiYXeuxNGDjIOA3xkAN/VR8uHPoy4OA==
X-Received: by 2002:a0c:8828:: with SMTP id 37mr3249987qvl.44.1570025966336;
        Wed, 02 Oct 2019 07:19:26 -0700 (PDT)
Received: from localhost ([132.205.230.8])
        by smtp.gmail.com with ESMTPSA id n44sm16531159qtf.51.2019.10.02.07.19.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Oct 2019 07:19:25 -0700 (PDT)
Message-ID: <5d94b1ed.1c69fb81.7069a.47e7@mx.google.com>
Date:   Wed, 02 Oct 2019 09:19:22 -0500
From:   Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] dt-bindings: mmc: renesas_sdhi: Add r8a774b1 support
References: <1569307615-38914-1-git-send-email-biju.das@bp.renesas.com>
In-Reply-To: <1569307615-38914-1-git-send-email-biju.das@bp.renesas.com>
Cc:     Ulf Hansson <ulf.hansson@linaro.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc:     Biju Das <biju.das@bp.renesas.com>, linux-mmc@vger.kernel.org,
        devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms@verge.net.au>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
To:     Biju Das <biju.das@bp.renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, 24 Sep 2019 07:46:55 +0100, Biju Das wrote:
> Document RZ/G2N (R8A774B1) SoC bindings.
> 
> Signed-off-by: Biju Das <biju.das@bp.renesas.com>
> ---
>  Documentation/devicetree/bindings/mmc/renesas,sdhi.txt | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>

