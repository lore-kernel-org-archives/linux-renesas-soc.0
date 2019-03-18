Return-Path: <SRS0=zXAj=RV=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 842C1C43381
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 18 Mar 2019 11:22:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 574A220857
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 18 Mar 2019 11:22:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726731AbfCRLWr (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 18 Mar 2019 07:22:47 -0400
Received: from mga14.intel.com ([192.55.52.115]:12796 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725973AbfCRLWr (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 18 Mar 2019 07:22:47 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 18 Mar 2019 04:22:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.58,493,1544515200"; 
   d="scan'208";a="123597953"
Received: from mylly.fi.intel.com (HELO [10.237.72.176]) ([10.237.72.176])
  by orsmga007.jf.intel.com with ESMTP; 18 Mar 2019 04:22:40 -0700
Subject: Re: [PATCH] i2c: document the SDA hold time binding
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-i2c@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Ludovic Desroches <ludovic.desroches@microchip.com>
References: <20190318103523.GQ9224@smile.fi.intel.com>
From:   Jarkko Nikula <jarkko.nikula@linux.intel.com>
Message-ID: <9eb15177-ce2c-0082-5810-97e41e750bee@linux.intel.com>
Date:   Mon, 18 Mar 2019 13:22:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.5.1
MIME-Version: 1.0
In-Reply-To: <20190318103523.GQ9224@smile.fi.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 3/18/19 12:35 PM, Andy Shevchenko wrote:
> On Mon, Feb 11, 2019 at 02:25:15PM +0100, Wolfram Sang wrote:
>> The documentation was forgotten when the feature was added.
>>
>> Fixes: 4717be73c284 ("i2c: core: Parse SDA hold time from firmware")
>> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
>> ---
>>
>> To everyone on CC: I want to confirm here that you use the value really for
>> t(hd:sta) and not t(hd:dat). I'd be a little confused otherwise...
> 
> I guess in our case it's also t(hd:dat).
> 
The DesignWare specification I have mention only tHD;DAT.

-- 
Jarkko
