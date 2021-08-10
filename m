Return-Path: <linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DBECC4338F
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 10 Aug 2021 20:36:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DD11360462
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 10 Aug 2021 20:36:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232996AbhHJUgj (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 10 Aug 2021 16:36:39 -0400
Received: from mxout03.lancloud.ru ([45.84.86.113]:40770 "EHLO
        mxout03.lancloud.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232989AbhHJUgj (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 10 Aug 2021 16:36:39 -0400
Received: from LanCloud
DKIM-Filter: OpenDKIM Filter v2.11.0 mxout03.lancloud.ru D89C5205F70D
Received: from LanCloud
Received: from LanCloud
Received: from LanCloud
Subject: Re: [PATCH] MAINTAINERS: switch to my OMP email for Renesas Ethernet
 drivers
From:   Sergey Shtylyov <s.shtylyov@omp.ru>
To:     <netdev@vger.kernel.org>
CC:     <linux-renesas-soc@vger.kernel.org>
References: <9c212711-a0d7-39cd-7840-ff7abf938da1@omp.ru>
Organization: Open Mobile Platform
Message-ID: <39b0e5e0-d845-270f-7bb9-1526a21071a8@omp.ru>
Date:   Tue, 10 Aug 2021 23:36:13 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <9c212711-a0d7-39cd-7840-ff7abf938da1@omp.ru>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [192.168.11.198]
X-ClientProxiedBy: LFEXT02.lancloud.ru (fd00:f066::142) To
 LFEX1907.lancloud.ru (fd00:f066::207)
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 8/10/21 11:17 PM, Sergey Shtylyov wrote:

> I'm still going to continue looking after the Renesas Ethernet drivers and
> device tree bindings. Now my new employer, Open Mobile Platform (OMP), will
> pay for all my upstream work. Let's switch to my OMP email for the reviews.
> 
> Signed-off-by: Sergey Shtylyov <s.shtylyov@omp.ru>
> 
> ---

   Forgot to mention that this patch was against DaveM's 'net.git' repo.

[...]

MBR, Sergey
