Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wr0-f171.google.com ([209.85.128.171]:39762 "EHLO
        mail-wr0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755283AbeBOKbB (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 15 Feb 2018 05:31:01 -0500
Subject: Re: [PATCH V2] ARM: dts: stout: Initial r8a7790 Stout board support
To: Wolfram Sang <wsa@the-dreams.de>
Cc: linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        robh+dt@kernel.org, Marek Vasut <marek.vasut+renesas@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Simon Horman <horms+renesas@verge.net.au>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
References: <20180215100301.24744-1-marek.vasut+renesas@gmail.com>
 <20180215100936.dz62mm3h2zbsuf2j@katana>
From: Marek Vasut <marek.vasut@gmail.com>
Message-ID: <4dfaaccb-c384-c640-d801-116e01410c22@gmail.com>
Date: Thu, 15 Feb 2018 11:11:51 +0100
MIME-Version: 1.0
In-Reply-To: <20180215100936.dz62mm3h2zbsuf2j@katana>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 02/15/2018 11:09 AM, Wolfram Sang wrote:
> 
>> +		stdout-path = "serial0:38400n8";
> 
> Didn't you want to change U-Boot to 115200?

I did, do we care about compatibility with whatever the board comes with
though or not ?

-- 
Best regards,
Marek Vasut
