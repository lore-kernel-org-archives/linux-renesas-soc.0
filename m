Return-Path: <SRS0=rsGL=QP=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17976C169C4
	for <linux-renesas-soc@archiver.kernel.org>; Fri,  8 Feb 2019 12:53:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id DB09F20857
	for <linux-renesas-soc@archiver.kernel.org>; Fri,  8 Feb 2019 12:53:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=cogentembedded-com.20150623.gappssmtp.com header.i=@cogentembedded-com.20150623.gappssmtp.com header.b="pUXtqEko"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727804AbfBHMxQ (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 8 Feb 2019 07:53:16 -0500
Received: from mail-lf1-f66.google.com ([209.85.167.66]:40360 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727740AbfBHMwj (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 8 Feb 2019 07:52:39 -0500
Received: by mail-lf1-f66.google.com with SMTP id t14so2441408lfk.7
        for <linux-renesas-soc@vger.kernel.org>; Fri, 08 Feb 2019 04:52:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Sstv+FariMaDhiPskpASC+lRTN6ZSuuUp6yHfV2vVeo=;
        b=pUXtqEkoPQZauIcsHjpB761HPyBOV3Iq5ePVbpOkaV8s6katFMt0diQdY5IVrOvjHx
         x0daotQvK6kMcXax4UNQrLOOe3ZRSRic6X4DrmdJRJbf7NBOXkEleXJRLAs8IEilrVqb
         B31puiKCR6nJCYaMHlu9Kg8GxOZpxwRB1gsJ2k+DjN5jbRr6VFPWlBCkTWrtISsySFmu
         ri+KyZ8VuxLtoRbLrAvg55AJ575XLTJeTa1HYhZgyZZwyM98NC12xc2mY45LpatU0uuA
         aRbQw+6q0aW8WIwEAzAFCzsygj6jH2uKjq5P7Rw9bdrkrTVAtLtEscDWEe//I03hNZ/l
         7ajw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=Sstv+FariMaDhiPskpASC+lRTN6ZSuuUp6yHfV2vVeo=;
        b=VydDnq621TNQGmCQMaCcu/K6L3/xkVtBFTokorQ5gGhND6ein/eh1GkMRKrggsujgc
         YvxUsTt3Iu6kqD4pU7cwxcG1lIssJ3EXJR4AiNwNVN1vIZ4/lpNHoZoeQkbCCQ9EQ3mt
         p4C863yrP5w2NpAAiInU9NGNWIU+wqSFStXn2eNHlPbiYx5HfegIFqGwN7JmHLZAOWDW
         yvRgtjAEOK6s8TUbBxBo6CAL9fyw5mzKXto5+lwHIoGRMWmXy9sI5VNdT0GKGsWn4hU7
         j1rlRuKpU5U+k6MWvUNZoC0ZPOxt80KJYRLf0Su4/3G8N0uir9JlnHqipG0LzCg7QLNQ
         O7aw==
X-Gm-Message-State: AHQUAuaoDZsozJRfYbbCEzD9ob5o2Xqxsg26DbKAXdevVpQ9cnOa4pFP
        xKqEMpUdLXmIKnHF+9OqUvf25w==
X-Google-Smtp-Source: AHgI3IYIX8QubbdZUqL0dfyxcVIoZ9Oo1GAT+HJwmp5FzO6CzomrM/ENEturuFWDVc+CALZ5MhfA/A==
X-Received: by 2002:ac2:5224:: with SMTP id i4mr6988894lfl.145.1549630356984;
        Fri, 08 Feb 2019 04:52:36 -0800 (PST)
Received: from wasted.cogentembedded.com ([31.173.84.132])
        by smtp.gmail.com with ESMTPSA id p77-v6sm405827lja.0.2019.02.08.04.52.35
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 08 Feb 2019 04:52:35 -0800 (PST)
Subject: Re: [PATCH 08/12] arm64: dts: renesas: r8a774c0: Add OPPs table for
 cpu devices
To:     Simon Horman <horms+renesas@verge.net.au>,
        linux-renesas-soc@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>
References: <cover.1549623801.git.horms+renesas@verge.net.au>
 <231d8908a66fa98f09553d31ad8cd5f382b29959.1549623801.git.horms+renesas@verge.net.au>
From:   Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Organization: Cogent Embedded
Message-ID: <7d60ebf5-c245-f48d-47db-ce63f4f3690b@cogentembedded.com>
Date:   Fri, 8 Feb 2019 15:52:34 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <231d8908a66fa98f09553d31ad8cd5f382b29959.1549623801.git.horms+renesas@verge.net.au>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello!

On 02/08/2019 02:13 PM, Simon Horman wrote:

> From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> 
> This patch defines OOP tables for all CPUs, similarly to
> what done by Takeshi Kihara and Yoshihiro Kaneko for the
> R8A77990.
> 
> Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
[...]
> @@ -55,6 +76,8 @@
>  			power-domains = <&sysc R8A774C0_PD_CA53_CPU0>;
>  			next-level-cache = <&L2_CA53>;
>  			enable-method = "psci";
> +			clocks =<&cpg CPG_CORE R8A774C0_CLK_Z2>;

   Need space after =...

> +			operating-points-v2 = <&cluster1_opp>;
>  		};
>  
>  		a53_1: cpu@1 {
> @@ -64,6 +87,8 @@
>  			power-domains = <&sysc R8A774C0_PD_CA53_CPU1>;
>  			next-level-cache = <&L2_CA53>;
>  			enable-method = "psci";
> +			clocks =<&cpg CPG_CORE R8A774C0_CLK_Z2>;


   Here as well...

> +			operating-points-v2 = <&cluster1_opp>;
>  		};
>  
>  		L2_CA53: cache-controller-0 {

MBR, Sergei
