Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lj1-f194.google.com ([209.85.208.194]:37901 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728111AbeHVXIM (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 22 Aug 2018 19:08:12 -0400
Received: by mail-lj1-f194.google.com with SMTP id p6-v6so2330003ljc.5
        for <linux-renesas-soc@vger.kernel.org>; Wed, 22 Aug 2018 12:41:59 -0700 (PDT)
Subject: Re: [PATCH] mmc: renesas_sdhi_internal_dmac: fix #define
 RST_RESERVED_BITS
To: Wolfram Sang <wsa@the-dreams.de>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org
References: <d5574b7b-9bb6-1f24-f2b4-2036c66a2924@cogentembedded.com>
 <20180822193844.tefn3ky2vlskfcwd@katana>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <0309adb6-c261-f9cf-528b-208950db208f@cogentembedded.com>
Date: Wed, 22 Aug 2018 22:41:56 +0300
MIME-Version: 1.0
In-Reply-To: <20180822193844.tefn3ky2vlskfcwd@katana>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 08/22/2018 10:38 PM, Wolfram Sang wrote:

>> The DM_CM_RST register actually has bits 0-31 defaulting to 1s and bits
>> 32-63 defaulting to 0s -- fix off-by-one in #define RST_RESERVED_BITS.
>>
>> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
> 
> Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> 
> Suggesting stable.

   Stable looks at the Fixes: tags now. Should I add that?

MBR, Sergei
