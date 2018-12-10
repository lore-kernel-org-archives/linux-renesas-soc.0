Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wr1-f65.google.com ([209.85.221.65]:41996 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727018AbeLJMzr (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 10 Dec 2018 07:55:47 -0500
Received: by mail-wr1-f65.google.com with SMTP id q18so10353247wrx.9
        for <linux-renesas-soc@vger.kernel.org>; Mon, 10 Dec 2018 04:55:46 -0800 (PST)
Subject: Re: [PATCH v4 1/5] nvmem: check invalid number of bytes in
 nvmem_device_{read,write}
To: Biju Das <biju.das@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Simon Horman <horms@verge.net.au>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org"
        <linux-renesas-soc@vger.kernel.org>
References: <1544182066-31528-1-git-send-email-biju.das@bp.renesas.com>
 <1544182066-31528-2-git-send-email-biju.das@bp.renesas.com>
 <3c09d148-7102-1ee5-770a-009e40de6168@linaro.org>
 <OSBPR01MB21034A6FB7EF6E877DA0F151B8A50@OSBPR01MB2103.jpnprd01.prod.outlook.com>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <e6643627-e6f3-5dad-9c3f-6babb8e0ce56@linaro.org>
Date: Mon, 10 Dec 2018 12:55:44 +0000
MIME-Version: 1.0
In-Reply-To: <OSBPR01MB21034A6FB7EF6E877DA0F151B8A50@OSBPR01MB2103.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>



On 10/12/18 12:45, Biju Das wrote:
>> Its better to move checks from
>> bin_attr_nvmem_read()/bin_attr_nvmem_write() into nvmem_reg_read()
>> and nvmem_reg_write(), so its easy to maintain, rather than adding them to
>> each function.
> Initially I also thought the same. But there are some RTC drivers which is using nvmem_device
> interface  is not defining "word_size"  member. That is the reason we need to add it in separate function.
> Can you please suggest how to handle the above drivers?

Word size is optional anyway, in the case where word_size is not 
specified, its considered as one byte word_size.

--srini

> 
