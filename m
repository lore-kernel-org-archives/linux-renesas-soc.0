Return-Path: <SRS0=9OK0=P7=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E4A3C282C0
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 23 Jan 2019 18:20:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id CBB9921850
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 23 Jan 2019 18:20:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=cogentembedded-com.20150623.gappssmtp.com header.i=@cogentembedded-com.20150623.gappssmtp.com header.b="fXrnJZe0"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726157AbfAWSUD (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 23 Jan 2019 13:20:03 -0500
Received: from mail-lf1-f66.google.com ([209.85.167.66]:34393 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726028AbfAWSUD (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 23 Jan 2019 13:20:03 -0500
Received: by mail-lf1-f66.google.com with SMTP id p6so2339684lfc.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 23 Jan 2019 10:20:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=/nEa5HFj5APWBnNaPcyepqtOrUMQ61xh9LpJMQl/NmA=;
        b=fXrnJZe0eFneqd5a20tCEe219TbTm0TSFQ9A48Wd69lZoJANCoURJR3++jqgbuNXLo
         oEs1KClORqca/rdEKJawkNIDMFkChNA/btythLstFDL5qfJmCVP9EMrBbdl/xS7+YOJu
         HNGvlBp51njOUf74W9GDNKuI+jwMf48TK76QPT75mK0/3R0k6rb/a5m9M2wLDd8rC8sD
         TUfEe0UPYygLk/6mYPaFVZXoMHI1wEVszLKnJYdmayHHC9MJ+nRMLBMACNiFPT2ibXIY
         IyW0Bai9wxwuAaRnw1/LPNVmIlMLlUENTd0wJW3lu9A/Y/R/hLTGt+s3Z6zUU2gU5AX2
         P5ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=/nEa5HFj5APWBnNaPcyepqtOrUMQ61xh9LpJMQl/NmA=;
        b=l88kna5BbTBT8Mp4bqLSTMvZzbHIttsiFNHz3SC4yxsw6JSEOEoiqaTLRNFZGgMIWh
         H2Z1w/3bAWmuGHsxEhVjbe+N1ItZYKU2c1m63kRlEIzupjBkHTcIDjJ8uUcJKjLs54Xy
         SYUQ3VTCCYBN3jECvyo45tpk2HJT17TAusTkvUy4jO1V2xcFj+Sw7u8ihfyfK3WqFIRc
         YhKaZT9i6weYed7aPhisTbcgfCTCiOCqiMa9j+bO0djXM6wa/65H94pSA6B6S/u8D3TI
         niiB3R0y10uDzKGSbNpx8XLoqIv6gWZSC6hH6DW4HKRnsrcQStlE4m5RtCybymIgpsNj
         6O2g==
X-Gm-Message-State: AJcUukeFtR0Z8bz3UDj6QRHsIc8K9IQElTmN+f/nqsL55qlC/FI9GVEs
        LbuIdOqqgNnVMKqIli0kVAT7ACDbATo=
X-Google-Smtp-Source: ALg8bN7dl8GtJDSga6VsM8Grs/lciplc7XsA9tiMG+Y0u0FH+01se2djfeawVArWDtrgl/iZkYZFJA==
X-Received: by 2002:a19:4cc3:: with SMTP id z186mr2611557lfa.37.1548267601523;
        Wed, 23 Jan 2019 10:20:01 -0800 (PST)
Received: from wasted.cogentembedded.com ([31.173.84.180])
        by smtp.gmail.com with ESMTPSA id j9sm595667lfk.74.2019.01.23.10.20.00
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 23 Jan 2019 10:20:00 -0800 (PST)
Subject: Re: [PATCH/RFC 00/02] Remove undocumented IMR-LX4 device nodes
To:     Magnus Damm <magnus.damm@gmail.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Simon Horman <horms+renesas@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Konstantin Kozhevnikov 
        <Konstantin.Kozhevnikov@cogentembedded.com>
References: <154807139502.25511.1919986589060151108.sendpatchset@octo>
 <CAMuHMdUe+Hjn7cJB19OpEt7=Stcj-=gvA1TxH-fEjDpTx1PG1g@mail.gmail.com>
 <CANqRtoTNk7MQuXmoEZ6aTbEbEEOg7t-B63USvjcxKs-7LWggSA@mail.gmail.com>
From:   Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Organization: Cogent Embedded
Message-ID: <d9f6abfa-e480-cd85-a1a4-0c2ad219200f@cogentembedded.com>
Date:   Wed, 23 Jan 2019 21:19:59 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <CANqRtoTNk7MQuXmoEZ6aTbEbEEOg7t-B63USvjcxKs-7LWggSA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello!

On 01/21/2019 03:01 PM, Magnus Damm wrote:

>> On Mon, Jan 21, 2019 at 12:49 PM Magnus Damm <magnus.damm@gmail.com> wrote:
>>> Remove undocumented IMR-LX4 device nodes
>>>
>>> [PATCH/RFC 01/02] arm64: dts: renesas: r8a7795: Remove IMR-LX4 device nodes
>>> [PATCH/RFC 02/02] arm64: dts: renesas: r8a7796: Remove IMR-LX4 device nodes
>>>
>>> These patches take the easy way out and simply remove the undocumented
>>> IMR-LX4 device nodes from the upstream tree. Good or bad, let me know!
>>>
>>> So perhaps this is a bit overly aggressive but since the DT bindings seem
>>> undocumented and no driver exists in upstream my gut feeling says these DT
>>> nodes were part of an upstreaming attempt that got suspended half-way through.
>>>
>>> In case DT binding documentation is in-flight and queued up somewhere
>>> (ideally together with a driver) then feel free to ignore this series.
>>>
>>> Instead of removing nodes we could also document the DT bindings for the
>>> IMR-LX4 devices. It would also make sense to add device nodes to other
>>> more recent SoCs than just H3 and M3-W. But blindly adding more DT nodes
>>> with a DT binding but without a driver seems a bit suboptimal compared to
>>> testing against an actual driver.
>>
>> [PATCH v5] media: platform: Renesas IMR driver
>> https://lore.kernel.org/linux-renesas-soc/20170309200818.786255823@cogentembedded.com/
> 
> Thanks, but that seems to be from 2017! =)

   I dropped the ball there, as I was tasked with upstreaming V3x support...
The last thing done about the IMR driver was talking to Hans in Prague in 2017.
I'm planning to return to the driver after I'm done with the HyperFlash driver.

> Cheers,
> 
> / magnus

MBR, Sergei
