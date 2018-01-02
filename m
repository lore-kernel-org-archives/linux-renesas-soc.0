Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f50.google.com ([209.85.215.50]:33627 "EHLO
        mail-lf0-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751760AbeABKJx (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 2 Jan 2018 05:09:53 -0500
Received: by mail-lf0-f50.google.com with SMTP id j143so9946792lfg.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 02 Jan 2018 02:09:52 -0800 (PST)
Subject: Re: [PATCH 1/2] ravb: kill redundant check in the probe() method
To: netdev@vger.kernel.org,
        "open list:RENESAS ETHERNET DRIVERS"
        <linux-renesas-soc@vger.kernel.org>
References: <20171231184444.642619406@cogentembedded.com>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <097a0013-17fc-4b74-0993-a672349efe5f@cogentembedded.com>
Date: Tue, 2 Jan 2018 13:09:52 +0300
MIME-Version: 1.0
In-Reply-To: <20171231184444.642619406@cogentembedded.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello!

On 12/31/2017 9:41 PM, Sergei Shtylyov wrote:

> Browsing thru the driver diassembly, I noticed that gcc was  able to

    Aw, it's disassembly!
    DaveM, is that worth reposting?

> figure  out  that the 'ndev' pointer is always non-NULL when calling
> free_netdev()  on the probe() method's  error path and  thus skip that
> redundant NULL check... gcc is smart, be like gcc! 
> 
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
[...]

MBR, Sergei
