Return-Path: <linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1327C433EF
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 23 Sep 2021 17:57:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B2ADC60F4B
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 23 Sep 2021 17:57:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241666AbhIWR73 (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Thu, 23 Sep 2021 13:59:29 -0400
Received: from mxout01.lancloud.ru ([45.84.86.81]:53694 "EHLO
        mxout01.lancloud.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241740AbhIWR73 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 23 Sep 2021 13:59:29 -0400
Received: from LanCloud
DKIM-Filter: OpenDKIM Filter v2.11.0 mxout01.lancloud.ru 775B02014EB6
Received: from LanCloud
Received: from LanCloud
Received: from LanCloud
Subject: Re: [RFC/PATCH 02/18] ravb: Rename the variables "no_ptp_cfg_active"
 and "ptp_cfg_active"
To:     Biju Das <biju.das.jz@bp.renesas.com>,
        "David S. Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>
CC:     Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        "Andrew Lunn" <andrew@lunn.ch>,
        Sergei Shtylyov <sergei.shtylyov@gmail.com>,
        "Geert Uytterhoeven" <geert+renesas@glider.be>,
        Adam Ford <aford173@gmail.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>
References: <20210923140813.13541-1-biju.das.jz@bp.renesas.com>
 <20210923140813.13541-3-biju.das.jz@bp.renesas.com>
 <e54aa4c9-9438-bd99-559a-6aaa3676d733@omp.ru>
 <OS0PR01MB59228BE53DE8DB7AA491F03F86A39@OS0PR01MB5922.jpnprd01.prod.outlook.com>
From:   Sergey Shtylyov <s.shtylyov@omp.ru>
Organization: Open Mobile Platform
Message-ID: <2d2760da-8400-c43a-8629-a16e78f79326@omp.ru>
Date:   Thu, 23 Sep 2021 20:57:55 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <OS0PR01MB59228BE53DE8DB7AA491F03F86A39@OS0PR01MB5922.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [192.168.11.198]
X-ClientProxiedBy: LFEXT01.lancloud.ru (fd00:f066::141) To
 LFEX1907.lancloud.ru (fd00:f066::207)
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 9/23/21 7:35 PM, Biju Das wrote:

[...]
>>> Rename the variable "no_ptp_cfg_active" with "no_gptp" with inverted
>>> checks and "ptp_cfg_active" with "ccc_gac".
>>
>>    That's not exactly rename, no? At least for the 1st case...
> 
> This is what we agreed as per last discussion[1]. 
> 
> https://patchwork.kernel.org/project/linux-renesas-soc/patch/20210825070154.14336-5-biju.das.jz@bp.renesas.com/

   Sorry, I've changed my mind about 'no_gpgp' after seeing all the checks. I'd like to avoiud the double negations
in those checks -- this should make the code more clear. My 1st idea (just 'gp[tp') turned out to be more practical,
sorry about this going back-and-forth. :-<

[...]

MBR, Sergey
