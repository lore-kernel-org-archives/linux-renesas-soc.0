Return-Path: <SRS0=lhsG=QE=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53DAFC282C8
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 28 Jan 2019 16:51:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 18FA92173C
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 28 Jan 2019 16:51:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1548694263;
	bh=WIsHekT+xHOhEQGk40a+w1UlZhKPbzwInSa6Y8V8AAQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-ID:From;
	b=UTxQGwFlfSKmeFWCWhPuH5S5w8oWI0LKRz6xLQH5R5BE5H+urgeRpzbabMLKHzGJX
	 6Qp4qL84u4XUEEtL+03e426cU2pbqkWzMqz4Dn/HcvpU0a3bjIfTAoUeBvT/oo+zjn
	 onKS5zmHzzQd2pqt/B/xJy+Yycdb/nrlLX/27Ol0=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388699AbfA1QT6 (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 28 Jan 2019 11:19:58 -0500
Received: from mail.kernel.org ([198.145.29.99]:55142 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2388693AbfA1QT5 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 28 Jan 2019 11:19:57 -0500
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id E353721916;
        Mon, 28 Jan 2019 16:19:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1548692397;
        bh=WIsHekT+xHOhEQGk40a+w1UlZhKPbzwInSa6Y8V8AAQ=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=TvBDWFIU/iU/VcRVAHb+DP4QxmSsYabvZogpU7RRBcKmRXfEAZVx13cPyDQ+sVRZH
         qQ2kOAOlTYX6PXRm9Ek27BJHjLmoiHqtrRfIN8SRvgCsf1XFAcm8p2RHv1eEdjGjmQ
         KM0KOkKCFX+AwkEdU1bjNIpuj+L7QGiRWW4wfQL0=
Received: by mail-qk1-f177.google.com with SMTP id 68so9671169qke.9;
        Mon, 28 Jan 2019 08:19:56 -0800 (PST)
X-Gm-Message-State: AJcUukc+P+6vP7nGbsFumhgnXGFJp0ktFr+8qvmWrTFx0jgjbYTe5dOd
        gd5JepjACubx7pI3yEpU7RAU5dLj67khP7olgA==
X-Google-Smtp-Source: ALg8bN6DTLMAsoKVygrlqdPbhHDQc8KHbACLWcXAy6vXonPhGc9PB1fOicjXBOKhdk1Mabx93JPWvzVQ3DGlvPiUyx0=
X-Received: by 2002:a37:a483:: with SMTP id n125mr19450547qke.184.1548692396107;
 Mon, 28 Jan 2019 08:19:56 -0800 (PST)
MIME-Version: 1.0
References: <20190128085529.20538-1-geert+renesas@glider.be>
In-Reply-To: <20190128085529.20538-1-geert+renesas@glider.be>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Mon, 28 Jan 2019 10:19:45 -0600
X-Gmail-Original-Message-ID: <CAL_JsqLERj+YvUKkSXGankR9+uraQPhy4iY=9HNpZZ-R=xh2yA@mail.gmail.com>
Message-ID: <CAL_JsqLERj+YvUKkSXGankR9+uraQPhy4iY=9HNpZZ-R=xh2yA@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: arm: renesas: Fix SoC mismatch for Stout
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Mark Rutland <mark.rutland@arm.com>,
        "open list:MEDIA DRIVERS FOR RENESAS - FCP" 
        <linux-renesas-soc@vger.kernel.org>, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, Jan 28, 2019 at 2:55 AM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
>
> make dtbs_check:
>
>     arch/arm/boot/dts/r8a7790-stout.dt.yaml: compatible: ['renesas,stout', 'renesas,r8a7790'] is not valid under any of the given schemas
>
> The Stout development board has an R-Car H2 (r8a7790) SoC, not an R-Car
> H1 (r8a7779).
>
> Fixes: 12749350567c819d ("dt-bindings: arm: Convert Renesas board/soc bindings to json-schema")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  Documentation/devicetree/bindings/arm/renesas.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Rob Herring <robh@kernel.org>
