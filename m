Return-Path: <linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9588BC433EF
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 14 Dec 2021 13:35:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234447AbhLNNfN (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 14 Dec 2021 08:35:13 -0500
Received: from mxout02.lancloud.ru ([45.84.86.82]:51986 "EHLO
        mxout02.lancloud.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229902AbhLNNfM (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 14 Dec 2021 08:35:12 -0500
Received: from LanCloud
DKIM-Filter: OpenDKIM Filter v2.11.0 mxout02.lancloud.ru 8CB802389EA7
Received: from LanCloud
Received: from LanCloud
Received: from LanCloud
Message-ID: <d4a00def-7765-e0e4-c5c7-8d648eeb8cf2@omp.ru>
Date:   Tue, 14 Dec 2021 16:35:02 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 6.3; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH] arm64: dts: renesas: r8a77961: Add lvsd0 device node
Content-Language: en-US
To:     Nikita Yushchenko <nikita.yoush@cogentembedded.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>
CC:     <linux-renesas-soc@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20211213211855.1052211-1-nikita.yoush@cogentembedded.com>
From:   Sergey Shtylyov <s.shtylyov@omp.ru>
Organization: Open Mobile Platform
In-Reply-To: <20211213211855.1052211-1-nikita.yoush@cogentembedded.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [192.168.11.198]
X-ClientProxiedBy: LFEXT02.lancloud.ru (fd00:f066::142) To
 LFEX1907.lancloud.ru (fd00:f066::207)
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello!

On 14.12.2021 0:18, Nikita Yushchenko wrote:

> Add the missing lvds0 node for the R-Car M3-W+ SoC.

    Typo in the subject (lvsd0)...

> Signed-off-by: Nikita Yushchenko <nikita.yoush@cogentembedded.com>
[...]

MBR, Sergey

