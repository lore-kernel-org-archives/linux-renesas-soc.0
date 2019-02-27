Return-Path: <SRS0=BEXM=RC=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DBCD7C43381
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 27 Feb 2019 07:10:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id AABDA21852
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 27 Feb 2019 07:10:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729155AbfB0HKT (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 27 Feb 2019 02:10:19 -0500
Received: from mga06.intel.com ([134.134.136.31]:54147 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728905AbfB0HKS (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 27 Feb 2019 02:10:18 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 26 Feb 2019 23:10:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.58,418,1544515200"; 
   d="scan'208";a="323743834"
Received: from mylly.fi.intel.com (HELO [10.237.72.68]) ([10.237.72.68])
  by fmsmga005.fm.intel.com with ESMTP; 26 Feb 2019 23:10:14 -0800
Subject: Re: [PATCH v4 1/2] dt: snps,designware-i2c: Add clock bindings
 documentation
To:     Wolfram Sang <wsa@the-dreams.de>
Cc:     Gareth Williams <gareth.williams.jx@renesas.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Phil Edworthy <phil.edworthy@renesas.com>,
        devicetree@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Luis Oliveira <Luis.Oliveira@synopsys.com>
References: <1550765459-14519-1-git-send-email-gareth.williams.jx@renesas.com>
 <1550765459-14519-2-git-send-email-gareth.williams.jx@renesas.com>
 <de2a72f3-6d2c-cc18-73f3-1e925bd5b88f@linux.intel.com>
 <20190226153921.GC839@kunai>
From:   Jarkko Nikula <jarkko.nikula@linux.intel.com>
Message-ID: <8ad4aca6-cdbd-d2bf-81e2-5e2cd04a05c0@linux.intel.com>
Date:   Wed, 27 Feb 2019 09:10:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.5.1
MIME-Version: 1.0
In-Reply-To: <20190226153921.GC839@kunai>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 2/26/19 5:39 PM, Wolfram Sang wrote:
> 
>>> + - clock-names : Contains the names of the clocks:
>>> +    "ic_clk", for the core clock used to generate the external I2C clock.
>>> +    "pclk", the peripheral clock, required for register accesses.
>>> +
>>
>> Actually it looks there is need to revert back to bus clock (or better) in
>> comments but keep the "pclk" property.
>>
>> The specification I have tells the ic_clk is the peripheral clock which runs
>> the logic and the pclk (exactly pclk) is for bus interface and where
>> registers are.
> 
> Can we make it "bus interface clock" then? I'd think this is a tad
> better.
> 
Yes, that makes it clear. Plain "interface clock" might work too. TI 
OMAPs are using that term for register access clock domains.

Luis: Does that make sense for HW point of view? You mention PCLK is 
called also as application clock but for me personally it is not as 
clear as interface clock when I see it. I'll let Luis have the final 
word here.

ic_clk - peripheral clock
pclk - (bus) interface/application clock

-- 
Jarkko
