Return-Path: <linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3B14C433F5
	for <linux-renesas-soc@archiver.kernel.org>; Mon,  9 May 2022 20:51:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229821AbiEIUzD (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 9 May 2022 16:55:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59900 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229460AbiEIUzB (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 9 May 2022 16:55:01 -0400
Received: from mxout04.lancloud.ru (mxout04.lancloud.ru [45.84.86.114])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 08DCB44749;
        Mon,  9 May 2022 13:51:04 -0700 (PDT)
Received: from LanCloud
DKIM-Filter: OpenDKIM Filter v2.11.0 mxout04.lancloud.ru 26BF020B056E
Received: from LanCloud
Received: from LanCloud
Received: from LanCloud
From:   Sergey Shtylyov <s.shtylyov@omp.ru>
Subject: Re: [PATCH v2 3/5] ravb: Support separate Line0 (Desc), Line1 (Err)
 and Line2 (Mgmt) irqs
To:     Phil Edworthy <phil.edworthy@renesas.com>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>
CC:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        <netdev@vger.kernel.org>, <linux-renesas-soc@vger.kernel.org>
References: <20220509142431.24898-1-phil.edworthy@renesas.com>
 <20220509142431.24898-4-phil.edworthy@renesas.com>
Organization: Open Mobile Platform
Message-ID: <f3c02e55-9627-dc75-e023-d0175eece37b@omp.ru>
Date:   Mon, 9 May 2022 23:51:00 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20220509142431.24898-4-phil.edworthy@renesas.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [192.168.11.198]
X-ClientProxiedBy: LFEXT01.lancloud.ru (fd00:f066::141) To
 LFEX1907.lancloud.ru (fd00:f066::207)
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 5/9/22 5:24 PM, Phil Edworthy wrote:

> R-Car has a combined interrupt line, ch22 = Line0_DiA | Line1_A | Line2_A.

   R-Car gen3?

> RZ/V2M has separate interrupt lines for each of these, so add a feature
> that allows the driver to get these interrupts and call the common handler.
> 
> Signed-off-by: Phil Edworthy <phil.edworthy@renesas.com>
> Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Sergey Shtylyov <s.shtylyov@omp.ru>

[...]

MBR, Sergey
