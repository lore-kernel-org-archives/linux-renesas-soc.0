Return-Path: <SRS0=TkaA=SA=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BB32C43381
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 29 Mar 2019 09:46:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 6BABF206B7
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 29 Mar 2019 09:46:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=fpond.eu header.i=@fpond.eu header.b="jBcGCTWk"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727387AbfC2Jqc (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 29 Mar 2019 05:46:32 -0400
Received: from mo4-p02-ob.smtp.rzone.de ([85.215.255.83]:26980 "EHLO
        mo4-p02-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728810AbfC2Jqb (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 29 Mar 2019 05:46:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1553852789;
        s=strato-dkim-0002; d=fpond.eu;
        h=Subject:References:In-Reply-To:Message-ID:Cc:To:From:Date:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=vOxsnYbx3RwERc92Qv2owbV0cky7AB69ypBWNegOxw8=;
        b=jBcGCTWkjOyoHhljCSWOPdpgh2FPI+5H5k1aN7i4vafA2S42mZVeWBCs5OekIIt5jH
        zCh16e44KHbtTKw6OVqk3AsaWPMRr0QxPmN/gqkJWzQithhnFVxoNMel4CzbmTe+YkAi
        pHIbCiJkod9Rgrr6HxL7UDWGeYCehXwtW75TvmD7OtLbAMBn7XTjSx0yGa+uGJ+QxGwF
        QtO57idXRKaciMXbqqB0BwgUWP8jjhwThqzHrnqVN1awbHnW7IxrPMaxG7t9T7DRqMmh
        /KTU6oAzTik6X+Je5YzDGwKFXrbkw3eS2A+Y31w6X9TdXor0rUDkwqeg20C44Y+jfTkh
        U78w==
X-RZG-AUTH: ":OWANVUa4dPFUgKR/3dpvnYP0Np73amq+g13rqGzmt2bYDnKIKaws6YXTsc4="
X-RZG-CLASS-ID: mo00
Received: from oxapp05-01.back.ox.d0m.de
        by smtp-ox.front (RZmta 44.18 AUTH)
        with ESMTPSA id L0be16v2T9kIEg4
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
        (Client did not present a certificate);
        Fri, 29 Mar 2019 10:46:18 +0100 (CET)
Date:   Fri, 29 Mar 2019 10:46:18 +0100 (CET)
From:   Ulrich Hecht <uli@fpond.eu>
To:     Dirk Behme <dirk.behme@de.bosch.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Eugeniu Rosca <erosca@de.adit-jv.com>
Cc:     Ulrich Hecht <ulrich.hecht+renesas@gmail.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
        Eugeniu Rosca <roscaeugeniu@gmail.com>,
        "George G. Davis" <george_davis@mentor.com>,
        Andy Lowe <andy_lowe@mentor.com>,
        Joshua Frkuska <joshua_frkuska@mentor.com>,
        Tobias Franzen <tfranzen@de.adit-jv.com>,
        Magnus Damm <magnus.damm@gmail.com>, Greg KH <greg@kroah.com>
Message-ID: <1244832967.1529522.1553852778122@webmail.strato.com>
In-Reply-To: <0f1048cb-ebca-2e66-9b77-70297be96054@de.bosch.com>
References: <1522856931-6225-1-git-send-email-ulrich.hecht+renesas@gmail.com>
 <20190327183555.GA23991@vmlxhi-102.adit-jv.com>
 <CAMuHMdXzspxfSTQSA980VcTusoXTWXDexJuKoOo5gaFGDypc1A@mail.gmail.com>
 <d3746902-bc33-f5f2-660a-4bda583e77d4@de.bosch.com>
 <a69eb7eb-451c-c32c-4772-798285f0cf9b@de.bosch.com>
 <0f1048cb-ebca-2e66-9b77-70297be96054@de.bosch.com>
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


> On March 29, 2019 at 8:05 AM Dirk Behme <dirk.behme@de.bosch.com> wrote:
> 
> 
> Hi Geert,
> 
> On 28.03.2019 12:30, Dirk Behme wrote:
> > On 28.03.2019 11:16, Dirk Behme wrote:
> * Testing the patch [5]
> 
> - int shift = min(-8, max(7, deviation / 2));
> + int shift = clamp(deviation / 2, -8, 7);
> 
> does *not* fix our issue. Or in other words: Testing was *not* successful.
> 
> * However, from review point of view we think that it fixes a serious 
> bug. So maybe it should be applied, anyhow?

It should.

> 
> * Using strace we managed to get some more information about the usage 
> of the serial port [6]. With this, we are talking about 57600 and not 115200
> 
> * Switching to dev_info() [7] as requested above we get
> 
> [    0.553256] e6560000.serial: ttySC3 at MMIO 0xe6560000 (irq = 41, 
> base_baud = 0) is a hscif
> [  161.418527] sh-sci e6560000.serial: BRG: 9600+0 bps using DL 1462 SR 19
> [  161.418543] sh-sci e6560000.serial: Using clk s3d1 for 9600+0 bps
> [  161.418813] sh-sci e6560000.serial: BRG: 57600-5 bps using DL 463 SR 10
> [  161.418824] sh-sci e6560000.serial: Using clk s3d1 for 57600-5 bps
> 
> * We are talking about a custom r8a7796 board

Reviewing the code, I have found another potential issue: the SRR (sampling rate) value is not validated; only values from 7 to 31 are permissible, according to the datasheet. The values in the debug output above would be fine, though.

So, for clarification: Is there a problem at 9600/57600 bps, or does it only occur at 115200 bps?

CU
Uli
