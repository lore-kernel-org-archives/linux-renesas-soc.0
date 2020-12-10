Return-Path: <linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 013F0C4361B
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 10 Dec 2020 14:21:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AF04523D22
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 10 Dec 2020 14:21:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733200AbgLJOUx (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Thu, 10 Dec 2020 09:20:53 -0500
Received: from mail.iot.bzh ([51.75.236.24]:6079 "EHLO mail.iot.bzh"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726431AbgLJOUx (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 10 Dec 2020 09:20:53 -0500
Received: from [192.168.1.26] (lfbn-ren-1-2120-93.w92-167.abo.wanadoo.fr [92.167.199.93])
        by mail.iot.bzh (Postfix) with ESMTPSA id DECE140099;
        Thu, 10 Dec 2020 15:19:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iot.bzh; s=20180822;
        t=1607609998; h=from:from:sender:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=70hxPkDUVIiaz6ACOvkGa7SkqtbitdPOLVlC8OMHLx4=;
        b=n37xAUeGZWXmB67EQTqIudGC7w0pcHK7mW9YsWXUz0tksXF7V3FHGCZCgMOX7AYB55nu2C
        Ic26az+UtTUlTRrZpuw7Nznu7Ui1k2Nsm0UWV0alnf9unnw9s1wCvyoO8fzGW4BLNWkieg
        6hNzhjVxhOJC7v4gvdsBLshHk/xP4qyUyVc6bAjhCSJYnDlb+Fe8QDJNtTX9uFz7niPMHm
        hbqVYMQz0KJwh1aD+gIjuTbUg1J8Tu6DYJlqpGpS+NPodMk/yHqYYhMaEa09SDY1qm3zzF
        oVV8TNxWdrDIHxD8OqwaVL1C7FntOzr/RFEFujjTgc6a55uXLpHIAzzHK7KaIQ==
Subject: Re: Parent clock for MFIS module
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>
References: <c84c0d96-b768-600a-e412-f25d5ae299e5@iot.bzh>
 <CAMuHMdWQomuhL71F9c9n1M=rUaAAnV9oPvN_mRQBK8vrLG8-Hw@mail.gmail.com>
From:   Julien Massot <julien.massot@iot.bzh>
Message-ID: <d8ad91a8-f8f9-4d3e-bbdd-9dddb41d40db@iot.bzh>
Date:   Thu, 10 Dec 2020 15:19:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <CAMuHMdWQomuhL71F9c9n1M=rUaAAnV9oPvN_mRQBK8vrLG8-Hw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert,

> Unfortunately this information isn't always properly documented in the
> Hardware User's Manual.  Based on the MFIS Block Diagram, I would
> say it must be one of the APB bus clocks.
> 
> The BSP uses R8A77970_CLK_S2D2 for R-Car V3M, which sounds
> reasonable. Reading the PCIe chapter, it could also be S3D1 or S3D3.
> However, in this case, the driver wouldn't care about the clock rate,
> so the actual parent clock used doesn't matter much.
> Hence S2D2 sounds acceptable to me.

Many thanks, let's put S2D2 then, patches are in flight !

Regards,

-- 
Julien Massot [IoT.bzh]
