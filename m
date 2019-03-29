Return-Path: <SRS0=TkaA=SA=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10485C43381
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 29 Mar 2019 11:01:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 2C169217F5
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 29 Mar 2019 11:01:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=fpond.eu header.i=@fpond.eu header.b="cqpbzh1h"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728755AbfC2LBy (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 29 Mar 2019 07:01:54 -0400
Received: from mo4-p02-ob.smtp.rzone.de ([85.215.255.83]:21921 "EHLO
        mo4-p02-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728697AbfC2LBy (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 29 Mar 2019 07:01:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1553857312;
        s=strato-dkim-0002; d=fpond.eu;
        h=Subject:References:In-Reply-To:Message-ID:Cc:To:From:Date:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=QXsW/5aJh1aaFtxGpkMw9duLI+d6tk6pYQCzFa7WGf0=;
        b=cqpbzh1hpax6DZ7LuZ12i3Wmg0C9LAbrdoVo4E/KqkQyxfGIetCrK3CedFW6HpiUZI
        E0MwywbWB3JORcw+2mF2fV8Ip0ep+UfurOtb6hA8rlHMTFoJ0vcyrTqvU5Fk+dimY2Cq
        CrVX4lewju537noXFlcWJcahbOuLXJzUM6YZhyU/uAcsmnCCPZ0hrN3KgJsBM3mGccoq
        tWyyen11a+nWqicBvAmolTJrBYFomhNUIgAc8Fo7UUIS8aLBLm32Oae1CmQ2i4RX3UTL
        9QOzLBngMRhBzdZogtcw691MTMVagFUJP9qsPSDlD6mi1hfqGA895IShqf0HxWI6MlXJ
        R17w==
X-RZG-AUTH: ":OWANVUa4dPFUgKR/3dpvnYP0Np73amq+g13rqGzmt2bYDnKIKaws6YXTsc4="
X-RZG-CLASS-ID: mo00
Received: from oxapp05-01.back.ox.d0m.de
        by smtp-ox.front (RZmta 44.18 AUTH)
        with ESMTPSA id L0be16v2TB1kFCS
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
        (Client did not present a certificate);
        Fri, 29 Mar 2019 12:01:46 +0100 (CET)
Date:   Fri, 29 Mar 2019 12:01:46 +0100 (CET)
From:   Ulrich Hecht <uli@fpond.eu>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Dirk Behme <dirk.behme@de.bosch.com>,
        Eugeniu Rosca <erosca@de.adit-jv.com>,
        Ulrich Hecht <ulrich.hecht+renesas@gmail.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
        Eugeniu Rosca <roscaeugeniu@gmail.com>,
        "George G. Davis" <george_davis@mentor.com>,
        Andy Lowe <andy_lowe@mentor.com>,
        Joshua Frkuska <joshua_frkuska@mentor.com>,
        Tobias Franzen <tfranzen@de.adit-jv.com>,
        Magnus Damm <magnus.damm@gmail.com>, Greg KH <greg@kroah.com>
Message-ID: <206731540.1535860.1553857306447@webmail.strato.com>
In-Reply-To: <664574064.1533743.1553855755610@webmail.strato.com>
References: <1522856931-6225-1-git-send-email-ulrich.hecht+renesas@gmail.com>
 <20190327183555.GA23991@vmlxhi-102.adit-jv.com>
 <CAMuHMdXzspxfSTQSA980VcTusoXTWXDexJuKoOo5gaFGDypc1A@mail.gmail.com>
 <d3746902-bc33-f5f2-660a-4bda583e77d4@de.bosch.com>
 <a69eb7eb-451c-c32c-4772-798285f0cf9b@de.bosch.com>
 <0f1048cb-ebca-2e66-9b77-70297be96054@de.bosch.com>
 <1244832967.1529522.1553852778122@webmail.strato.com>
 <CAMuHMdUf6rKxUi14DyJ2kJOGoZA2T+ktTpusBpaJD3rRJ0ZZzg@mail.gmail.com>
 <664574064.1533743.1553855755610@webmail.strato.com>
Subject: Re: [PATCH v2] serial: sh-sci: Support for HSCIF RX sampling point
 adjustment
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Priority: 3
Importance: Medium
X-Mailer: Open-Xchange Mailer v7.8.4-Rev51
X-Originating-IP: 188.195.25.140
X-Originating-Client: open-xchange-appsuite
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


> On March 29, 2019 at 11:35 AM Ulrich Hecht <uli@fpond.eu> wrote:
> 
> 
> 
> > On March 29, 2019 at 10:56 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > 
> > 
> > Hi Uli,
> > 
> > On Fri, Mar 29, 2019 at 10:46 AM Ulrich Hecht <uli@fpond.eu> wrote:
> > > Reviewing the code, I have found another potential issue: the SRR (sampling rate) value is not validated; only values from 7 to 31 are permissible, according to the datasheet. The values in the debug output above would be fine, though.
> > 
> > Isn't that handled by
> > 
> >                 .sampling_rate_mask = SCI_SR_RANGE(8, 32),
> > 
> > ?
> 
> Having crawled through the related macros, I can confirm that it is.

There is, however, another restriction that is not checked for: The sampling point shift must not exceed half of the sampling rate in either direction. This could happen ATM if the sampling rate is below 16 and the deviation from the desired bit rate is quite large.

That is not so in the case for which debug output has been provided, though, in which the bit rate error is so small that shifting isn't enabled to begin with. I would thus still like to know the numbers for 115200 bps.

CU
Uli
