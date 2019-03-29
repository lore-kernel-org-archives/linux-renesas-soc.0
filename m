Return-Path: <SRS0=TkaA=SA=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55574C43381
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 29 Mar 2019 14:11:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 68EFB217F5
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 29 Mar 2019 14:11:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=fpond.eu header.i=@fpond.eu header.b="lFJfqY2O"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729272AbfC2OLs (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 29 Mar 2019 10:11:48 -0400
Received: from mo4-p01-ob.smtp.rzone.de ([85.215.255.54]:22815 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728839AbfC2OLr (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 29 Mar 2019 10:11:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1553868705;
        s=strato-dkim-0002; d=fpond.eu;
        h=Subject:References:In-Reply-To:Message-ID:Cc:To:From:Date:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=0Jc1+WjWHiBaNtpDggoIfLKDu0BE8mmX2fy8auhEw0g=;
        b=lFJfqY2OYZu66achm3l0qfLBmPyyM4KDy6UIS0Q5SGpmb0lroQo402ZwiZdcrX24PQ
        oFEWJgk4Rb86ZI5MY4WUJaIEhJUigPmwhR368UzZ91mriDnJWRJXXZPHYxvpWr0Upe4E
        L00HHHFI91WoMYRGJJbaNCp1xskIktgTQ24ncLvX8lO6ieOa/fQMEeBjhmo8eeLFES1c
        kQDvC6n+HE/QS5SAKlXfPh0O2Kkw7+DSQwva/Q6KE6XreSelISlSKRsI5m2zDeHCY6sj
        D9ihHAlzrAHlQce/Vjvn3Y2JPly3yVu2/k4P/E0ExfMK4ZPREZiN1rZDp01vs+rtCdzg
        fVrg==
X-RZG-AUTH: ":OWANVUa4dPFUgKR/3dpvnYP0Np73amq+g13rqGzmt2bYDnKIKaws6YXTsc4="
X-RZG-CLASS-ID: mo00
Received: from oxapp05-01.back.ox.d0m.de
        by smtp-ox.front (RZmta 44.18 AUTH)
        with ESMTPSA id L0be16v2TEBcGDo
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
        (Client did not present a certificate);
        Fri, 29 Mar 2019 15:11:38 +0100 (CET)
Date:   Fri, 29 Mar 2019 15:11:38 +0100 (CET)
From:   Ulrich Hecht <uli@fpond.eu>
To:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Dirk Behme <dirk.behme@de.bosch.com>
Cc:     Eugeniu Rosca <erosca@de.adit-jv.com>,
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
Message-ID: <383749640.1548509.1553868698508@webmail.strato.com>
In-Reply-To: <CAMuHMdXKkjqNzoXVezO9Do-0y70-+71OkYuXC_FFz-7cFeNmjA@mail.gmail.com>
References: <1522856931-6225-1-git-send-email-ulrich.hecht+renesas@gmail.com>
 <20190327183555.GA23991@vmlxhi-102.adit-jv.com>
 <CAMuHMdXzspxfSTQSA980VcTusoXTWXDexJuKoOo5gaFGDypc1A@mail.gmail.com>
 <d3746902-bc33-f5f2-660a-4bda583e77d4@de.bosch.com>
 <a69eb7eb-451c-c32c-4772-798285f0cf9b@de.bosch.com>
 <0f1048cb-ebca-2e66-9b77-70297be96054@de.bosch.com>
 <CAMuHMdUd+0wt=eZ+M8NOYZOTzLX2VH7hpzbMyZC3+fJEnXrUkA@mail.gmail.com>
 <3dc6a66a-c057-af29-2a2e-c526a4d2a30a@de.bosch.com>
 <CAMuHMdXKkjqNzoXVezO9Do-0y70-+71OkYuXC_FFz-7cFeNmjA@mail.gmail.com>
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


> On March 29, 2019 at 2:00 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> Fixed by:
> 
> -                       int deviation = min_err * srr * last_stop / 2 / baud;
> +                       int deviation = (int)(min_err * srr * last_stop) / 2 /
> +                                       (int)baud;
> 
> Before I sent a patch: Uli, shouldn't the formula use "(srr + 1)"
> instead of "srr", as the actual sampling rate factor is one more than
> the value programmed in HSSRR.SRCYC?

Yes, it should.

CU
Uli
