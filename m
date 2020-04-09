Return-Path: <SRS0=YZYO=5Z=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19F99C2BBFD
	for <linux-renesas-soc@archiver.kernel.org>; Thu,  9 Apr 2020 09:49:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D20E521D79
	for <linux-renesas-soc@archiver.kernel.org>; Thu,  9 Apr 2020 09:39:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=cogentembedded-com.20150623.gappssmtp.com header.i=@cogentembedded-com.20150623.gappssmtp.com header.b="V7oI1N4Q"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726632AbgDIJj7 (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Thu, 9 Apr 2020 05:39:59 -0400
Received: from mail-lf1-f66.google.com ([209.85.167.66]:45069 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726620AbgDIJj6 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 9 Apr 2020 05:39:58 -0400
Received: by mail-lf1-f66.google.com with SMTP id f8so7370747lfe.12
        for <linux-renesas-soc@vger.kernel.org>; Thu, 09 Apr 2020 02:39:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=i9hj27ADd+17C+KGuD555EZkHehi83Ox596cp2GT9jY=;
        b=V7oI1N4QzARgNUD+zjSXP9qPd1SwFm0eFfUrdMo0BWluWbqsr3Uj4VVBWqiH1lK8jG
         iBjPK5A5i4YWQr19OtCvlx6F5JI5Kj6Tc5SIWupgmn2aoKs60bQB3KospHPVZJ996n2V
         Pr6jxbDsrkrRbgCHISuFxmoCs/QZOkIXSAYinkIIORVXo/Fm4GuNQfdiYCtN41KqdK2M
         UJkTdUkJUaln9HS4V5gS2m0GLIE3/437bEcVrVG8atfdWS2mBha3hMBf17+82UboQ1fk
         adDoCYASdAxdDqfiVNxrYAtLmdRECdwwT5aSjUnPunb4jhnI016t+b+YZVouIVJKpsF6
         5MeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=i9hj27ADd+17C+KGuD555EZkHehi83Ox596cp2GT9jY=;
        b=IVH+E6+M+Gg7yIwbcbIRpbGGBIUWilLn/vydxrCiEIXwegh39KRYZNRxAaGkn1HeFz
         bFsv9pqqZbpmthidfOD2OJDuHtUgiAvwJOrcRC37Af7hhuu8Ci9G6UYbmJdXmhdltXEA
         qKg1iUnfXvlin//Ib5rW4a7zqtIt4y4NyJIinpsDmBBfQ4y00jNvmUlMpFOELlbn+9tF
         +lnUj/XCaBjihEvZjb9dcC6PCLOir37XjynM92cxMtAXHVMHTdd3Kc0r7uFcr4zqUCYa
         SF3rLb98h51AY7GrJkmqsWgXIQ/XveDiEseE1ts6/3KBTWorlBhRa7oRUM1qI1EeNfpG
         yrqQ==
X-Gm-Message-State: AGi0PuZjMOKo9xyDtJPByevMHRNKvk7EF8ONlLU3rvrj+fcqkheHctTW
        1z8c/Bq7TZz1eqCspNq5MBErqYFKCF8+4g==
X-Google-Smtp-Source: APiQypI8ZMs5zHNTel6RghTB6VGJ1Hiffnb8Q9ocT3qWKuwf1QRuH6Mu5rz8D1GHtiYNkRLnzg+A7A==
X-Received: by 2002:a19:e049:: with SMTP id g9mr7454758lfj.198.1586425196108;
        Thu, 09 Apr 2020 02:39:56 -0700 (PDT)
Received: from ?IPv6:2a00:1fa0:429a:a2f1:594e:c9e:26a1:8a11? ([2a00:1fa0:429a:a2f1:594e:c9e:26a1:8a11])
        by smtp.gmail.com with ESMTPSA id c21sm3333953lfh.16.2020.04.09.02.39.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Apr 2020 02:39:55 -0700 (PDT)
Subject: Re: [PATCH 0/2] drm: bridge: simple-bridge: Enable usage with DRM
 bridge connector helper
To:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        dri-devel@lists.freedesktop.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Andrzej Hajda <a.hajda@samsung.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Maxime Ripard <maxime@cerno.tech>
References: <20200409003636.11792-1-laurent.pinchart+renesas@ideasonboard.com>
From:   Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <0b0eaf1e-793a-e67f-d5c2-d6e5f6ac2cb9@cogentembedded.com>
Date:   Thu, 9 Apr 2020 12:39:47 +0300
User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200409003636.11792-1-laurent.pinchart+renesas@ideasonboard.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello!

On 09.04.2020 3:36, Laurent Pinchart wrote:

> This small patch series enables usage of the simple-bridge driver with
> the DRM bridge connector helper (drm_bridge_connector.c). Patch 1/2
> starts by simplifying the driver by delegating DDC handling to the next
> bridge in the chain, and patch 2/2 makes the connector creation
> optional.
> 
> I will continue converting existing bridge drivers to this new model,
> starting with the adv7511, rcar-lvds and dw-hdmi bridges. Anyone willing
> to give a

    What? :-)

> and converting additional bridge drivers is more than welcome
> :-)
> 
> Laurent Pinchart (2):
>    drm: bridge: simple-bridge: Delegate operations to next bridge
>    drm: bridge: simple-bridge: Make connector creation optional
> 
>   drivers/gpu/drm/bridge/simple-bridge.c | 107 +++++++++----------------
>   1 file changed, 36 insertions(+), 71 deletions(-)

MBR, Sergei
