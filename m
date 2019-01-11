Return-Path: <SRS0=sjaF=PT=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA7D7C43387
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 11 Jan 2019 15:22:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 6B3CD20675
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 11 Jan 2019 15:22:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=cogentembedded-com.20150623.gappssmtp.com header.i=@cogentembedded-com.20150623.gappssmtp.com header.b="aD0ReUDf"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727821AbfAKPWQ (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 11 Jan 2019 10:22:16 -0500
Received: from mail-lj1-f193.google.com ([209.85.208.193]:36881 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1733120AbfAKPWQ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 11 Jan 2019 10:22:16 -0500
Received: by mail-lj1-f193.google.com with SMTP id t18-v6so13270525ljd.4
        for <linux-renesas-soc@vger.kernel.org>; Fri, 11 Jan 2019 07:22:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=CAHW3MA1QGSJtFoirV1yCS4wvsCkqsBlRicGgR2HsYk=;
        b=aD0ReUDfXKXg8KHheKN4hys9FZQB9kYBgsxaT/5pGSQLhV/YhE59I/aP/4CtEmVwlE
         H9+QsJXVAOC35gBkJq0SvgJ2Um7vrzjBHxBeLtncFYsppll1baCENJvW6YLmM4z3/ls4
         f9sIjxzuitA/LkJIISw63xgmXkRhpfSC5k0Mf4gP0XweyL37L7du57P+u7CP7zTpgItV
         nZaOAKg9Veah5Gcobm+U6SAKuueeSkJANAtGlXVYxjpt3f752xSOK3VAUnHjcrsfPVch
         0j2F4SFAeldmU7/ZoSX9NN6A9NXnKUjXhbCdi/nHMCvfwwwp3TB0J3IwfVYYJ5G3Ocvl
         PTag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=CAHW3MA1QGSJtFoirV1yCS4wvsCkqsBlRicGgR2HsYk=;
        b=uKSwWvdaekrb8hXq12TJd4/oWHpT6EAZmV84FfzvuWnamjXLLEKpDJdo7KUh4o7EJ7
         jFu7ZSldGXbGXU9HWKOJJGxz3+Ct/AhH8AZZqpUncR4rxDpFNgjiIyovAgWFS1Jhft/1
         xZdKo8gDQCQ/iUfh/SaCxq+9Y/drKjpnqFKWhLLMaOPlX0d2cc3FT/arkQLM0R2sP8Y7
         eGeenLt3lr3pTOWFFQ/yhYLowVbK0eZ9iFlJy7vnPgi7/u4ZMSlPYQqlDorJU8PFJquA
         8hi9uDUmYU8TbWS54lCitmToUPDAZnXdNFweBJvTbBSq01spGnFoUtQFxaCZuhWhUdDK
         E5cQ==
X-Gm-Message-State: AJcUukdh9NdvU6XOSAmyE8CoOMI4KmzCRjpOKRuWtEGYerOY47Wy48BE
        9plyx5yJNr0zAyprrTlzmgHT9aIGuvM=
X-Google-Smtp-Source: ALg8bN5fXpD7fywfOp0Dg8GVBRcZLtcKq0VSbUUsXFevd/Jpajr49lnptwpZvHiTnya+Qq1Kv1+LHQ==
X-Received: by 2002:a2e:908b:: with SMTP id l11-v6mr8798254ljg.150.1547220134350;
        Fri, 11 Jan 2019 07:22:14 -0800 (PST)
Received: from wasted.cogentembedded.com ([31.173.81.86])
        by smtp.gmail.com with ESMTPSA id 12-v6sm15751261ljf.96.2019.01.11.07.22.13
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 11 Jan 2019 07:22:13 -0800 (PST)
Subject: Re: [PATCH net] ravb: expand rx descriptor data to accommodate hw
 checksum
To:     Simon Horman <horms@verge.net.au>
Cc:     David Miller <davem@davemloft.net>,
        Magnus Damm <magnus.damm@gmail.com>, netdev@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
References: <20190110140222.32740-1-horms+renesas@verge.net.au>
 <3a5c3a17-a410-fba7-32eb-a3495c5378de@cogentembedded.com>
 <20190111133502.dma5hft5wgowdg6l@verge.net.au>
From:   Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Organization: Cogent Embedded
Message-ID: <c4b650e0-709b-d078-e094-41b652603906@cogentembedded.com>
Date:   Fri, 11 Jan 2019 18:22:12 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <20190111133502.dma5hft5wgowdg6l@verge.net.au>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 01/11/2019 04:35 PM, Simon Horman wrote:

>>> EtherAVB may provide a checksum of packet data appended to packet data. In
>>> order to allow this checksum to be received by the host descriptor data
>>> needs to be enlarged by 2 bytes to accommodate the checksum.
>>>
>>> In the case of MTU-sized packets without a VLAN tag the
>>> checksum were already accommodated by virtue of the space reserved for the
>>> VLAN tag. However, a packet of MTU-size with a  VLAN tag consumed all
>>> packet data space provided by a descriptor leaving no space for the
>>> trailing checksum.
>>
>>    Wait! The gen3 manual is rather clear about the auto-checksumming not working
>> right in the presence of the VLAN tag. Where do you check for that case?
> 
> In my testing on E3 this works correctly. Which portion of
> the manual are you referring to?

   Section 50.4.1 in R-Car Series, 3rd Generation User’s Manual: Hardware, Rev 1.00,
section 45A.3.14.1 in R-Car Series, 2nd Generation User’s Manual: Hardware, Rev 2.00.
   The problem is that the checksum is always calculated starting at byte 14, i.e.
amidst the VLAN header (if present).

>>
>>> This was not detected by the driver which incorrectly used the last two
>>> bytes of packet data as the checksum and truncate the packet by two bytes.
>>> This resulted all such packets being dropped.
>>>
>>> A work around is to disable rx checksum offload
>>>  # ethtool -K eth0 rx off
>>>
>>> This patch resolves this problem by increasing the size available for
>>> packet data in rx descriptors by two bytes. It also introduces
>>> RAVB_CSUM_LEN to make things a little clearer than "2" sprinkled lightly
>>> over the driver.
>>
>>    What about using sizeof(__sum16) instead? That type is declared in
>> <linux/types.h> and used in 'struct iphdr'...
> 
> As in the following?
> 
> #define RAVB_CSUM_LEN sizeof(__sum16)

   No, as I said, I'd prefer to avoid any driver specific #define's.

>>> Tested on R-Car E3 (r8a77990) ES1.0 based Ebisu-4D board
>>>
>>> Fixes: 4d86d3818627 ("ravb: RX checksum offload")
>>> Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
>> [...]

MBR, Sergei
