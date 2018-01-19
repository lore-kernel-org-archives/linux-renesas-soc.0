Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f68.google.com ([209.85.215.68]:43089 "EHLO
        mail-lf0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754712AbeASI37 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 19 Jan 2018 03:29:59 -0500
Received: by mail-lf0-f68.google.com with SMTP id o89so1093927lfg.10
        for <linux-renesas-soc@vger.kernel.org>; Fri, 19 Jan 2018 00:29:58 -0800 (PST)
Subject: Re: [PATCH/RFC 01/03] arm64: dts: renesas: r8a77970: Add PFC node for
 Eagle V3M
To: Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org
References: <151630243226.14098.14517816422611139335.sendpatchset@little-apple>
 <151630244106.14098.1751390484334216468.sendpatchset@little-apple>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <72bcda3c-e32c-8259-b4ea-c9830d666370@cogentembedded.com>
Date: Fri, 19 Jan 2018 11:29:56 +0300
MIME-Version: 1.0
In-Reply-To: <151630244106.14098.1751390484334216468.sendpatchset@little-apple>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello!

On 1/18/2018 10:07 PM, Magnus Damm wrote:

> From: Magnus Damm <damm+renesas@opensource.se>
> 
> Add DT nodes for the PFC on the r8a77970 SoC and hook up the SCIF
> console to make use of the PFC to configure the pins.
> 
> Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
> ---
> 
>   Depends on r8a77970 PFC support - included in latest renesas-drivers

    Magnus, I have already posted R8A77970 PFC stuff back in November:

https://patchwork.kernel.org/patch/10053687/
https://patchwork.kernel.org/patch/10053689/

MBR, Sergei
