Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f53.google.com ([209.85.215.53]:33199 "EHLO
        mail-lf0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751563AbdFJT0R (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 10 Jun 2017 15:26:17 -0400
Received: by mail-lf0-f53.google.com with SMTP id m77so14761137lfe.0
        for <linux-renesas-soc@vger.kernel.org>; Sat, 10 Jun 2017 12:26:16 -0700 (PDT)
Subject: Re: [PATCH v2] sh_eth: add support to change MTU
To: =?UTF-8?Q?Niklas_S=c3=b6derlund?= <niklas.soderlund@ragnatech.se>
References: <20170609203215.1206-1-niklas.soderlund+renesas@ragnatech.se>
 <20170609203658.GB17461@bigcity.dyn.berto.se>
Cc: netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <239c39ff-cf0e-d332-7b52-098ba8029798@cogentembedded.com>
Date: Sat, 10 Jun 2017 22:26:13 +0300
MIME-Version: 1.0
In-Reply-To: <20170609203658.GB17461@bigcity.dyn.berto.se>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello!

On 06/09/2017 11:36 PM, Niklas Söderlund wrote:

>> The hardware supports the MTU to be changed and the driver it self is
>> somewhat prepared to support this. This patch hooks up the callbacks to
>> be able to change the MTU from user-space.
>>
>> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
>> Acked-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
>> ---
[...]
>> @@ -3171,6 +3184,13 @@ static int sh_eth_drv_probe(struct platform_device *pdev)
>>  	}
>>  	sh_eth_set_default_cpu_data(mdp->cd);
>>
>> +	/* User's manua states max MTU should be 2048 but due to the
>
> s/manua/manual/

    Looking at it for another time, I'd also reword the subject -- something 
like "sh_eth: add support for changing MTU" or "sh_eth: add MTU change support".

MBR, Sergei
