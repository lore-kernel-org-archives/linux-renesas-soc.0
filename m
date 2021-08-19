Return-Path: <linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFFB1C432BE
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 19 Aug 2021 15:26:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B84D960F14
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 19 Aug 2021 15:26:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238643AbhHSP1V (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Thu, 19 Aug 2021 11:27:21 -0400
Received: from mxout02.lancloud.ru ([45.84.86.82]:57200 "EHLO
        mxout02.lancloud.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240078AbhHSP1U (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 19 Aug 2021 11:27:20 -0400
Received: from LanCloud
DKIM-Filter: OpenDKIM Filter v2.11.0 mxout02.lancloud.ru C582920CE024
Received: from LanCloud
Received: from LanCloud
Received: from LanCloud
Subject: Re: [PATCH net-next v3 1/9] ravb: Use unsigned int for num_tx_desc
 variable in struct ravb_private
To:     Biju Das <biju.das.jz@bp.renesas.com>,
        "David S. Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>
CC:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Sergey Shtylyov <s.shtylyov@omprussia.ru>,
        Adam Ford <aford173@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
        Yuusuke Ashizuka <ashiduka@fujitsu.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        <netdev@vger.kernel.org>, <linux-renesas-soc@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        "Prabhakar Mahadev Lad" <prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20210818190800.20191-1-biju.das.jz@bp.renesas.com>
 <20210818190800.20191-2-biju.das.jz@bp.renesas.com>
From:   Sergey Shtylyov <s.shtylyov@omp.ru>
Organization: Open Mobile Platform
Message-ID: <fa03c906-ba83-29de-1559-3cf72533628f@omp.ru>
Date:   Thu, 19 Aug 2021 18:26:40 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210818190800.20191-2-biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [192.168.11.198]
X-ClientProxiedBy: LFEXT02.lancloud.ru (fd00:f066::142) To
 LFEX1907.lancloud.ru (fd00:f066::207)
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 8/18/21 10:07 PM, Biju Das wrote:

> The number of TX descriptors per packet is an unsigned value and
> the variable for holding this information should be unsigned.
> 
> This patch replaces the data type of num_tx_desc variable in struct
> ravb_private from 'int' to 'unsigned int'.
> This patch also updates the data type of local variables to unsigned int,
> where the local variables are evaluated using num_tx_desc.
> 
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Sergey Shtylyov <s.shtylyov@omp.ru>

[...]

MBR, Sergey
