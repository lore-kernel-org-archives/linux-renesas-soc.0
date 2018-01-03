Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f67.google.com ([209.85.215.67]:40433 "EHLO
        mail-lf0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751195AbeACPfY (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 3 Jan 2018 10:35:24 -0500
Received: by mail-lf0-f67.google.com with SMTP id u84so2058363lff.7
        for <linux-renesas-soc@vger.kernel.org>; Wed, 03 Jan 2018 07:35:24 -0800 (PST)
Subject: Re: [PATCH 0/2] Kill redundant checks in the Renesas Ethernet drivers
To: David Miller <davem@davemloft.net>
Cc: netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org
References: <20171231184134.684953583@cogentembedded.com>
 <20180103.102155.745876383952341968.davem@davemloft.net>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <868a859e-2a0a-8cf4-0271-8a15a3357302@cogentembedded.com>
Date: Wed, 3 Jan 2018 18:35:21 +0300
MIME-Version: 1.0
In-Reply-To: <20180103.102155.745876383952341968.davem@davemloft.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello!

On 01/03/2018 06:21 PM, David Miller wrote:

> From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
> Date: Sun, 31 Dec 2017 21:41:34 +0300
> 
>> Here's a set of 2 patches against DaveM's 'net-next.git' repo removing
>> redundant checks in the driver probe() methods.
> 
> Series applied with the "disassembly" typo fixed.

    Thank you. Expect a fix for a 'sh_eth' bug added in 2013 soonish. :-)

MBR, Sergei
