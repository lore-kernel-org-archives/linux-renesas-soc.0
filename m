Return-Path: <SRS0=Tt7D=PL=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0
	tests=HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_PASS,URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96ED2C43387
	for <linux-renesas-soc@archiver.kernel.org>; Thu,  3 Jan 2019 15:45:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 6F85320815
	for <linux-renesas-soc@archiver.kernel.org>; Thu,  3 Jan 2019 15:45:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729721AbfACPpL (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Thu, 3 Jan 2019 10:45:11 -0500
Received: from usa-sjc-mx-foss1.foss.arm.com ([217.140.101.70]:51806 "EHLO
        foss.arm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729605AbfACPpL (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 3 Jan 2019 10:45:11 -0500
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 733CBA78;
        Thu,  3 Jan 2019 07:45:10 -0800 (PST)
Received: from edgewater-inn.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.72.51.249])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 4149E3F575;
        Thu,  3 Jan 2019 07:45:10 -0800 (PST)
Received: by edgewater-inn.cambridge.arm.com (Postfix, from userid 1000)
        id 6D9AA1AE0BD1; Thu,  3 Jan 2019 15:45:10 +0000 (GMT)
Date:   Thu, 3 Jan 2019 15:45:10 +0000
From:   Will Deacon <will.deacon@arm.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Arnd Bergmann <arnd@arndb.de>
Subject: Re: renesas-drivers-2018-12-26-v4.20
Message-ID: <20190103154510.GH16311@edgewater-inn.cambridge.arm.com>
References: <20181226110530.13136-1-geert+renesas@glider.be>
 <TY2PR01MB48127A0F2DCB00880576DEBCD8B60@TY2PR01MB4812.jpnprd01.prod.outlook.com>
 <CAMuHMdXjXi1dbpk0sOf-qhzJB+uzMVYyyMVHRqv+QSCeNVVgtQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdXjXi1dbpk0sOf-qhzJB+uzMVYyyMVHRqv+QSCeNVVgtQ@mail.gmail.com>
User-Agent: Mutt/1.11.1+30 (d10eec459b35) ()
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, Dec 27, 2018 at 11:12:25AM +0100, Geert Uytterhoeven wrote:
> Hi Shimoda-san,
> 
> Thanks for the report!
> 
> CC Will (commit author), Arnd (compiler collective).
> 
> On Thu, Dec 27, 2018 at 2:58 AM Yoshihiro Shimoda
> <yoshihiro.shimoda.uh@renesas.com> wrote:
> > > From: Geert Uytterhoeven, Sent: Wednesday, December 26, 2018 8:06 PM
> > > I have pushed renesas-drivers-2018-12-26-v4.20 to
> > > https://git.kernel.org/cgit/linux/kernel/git/geert/renesas-drivers.git
> > >
> > > This tree is meant to ease development of platform support and drivers
> > > for Renesas ARM SoCs. It is created by merging (a) the for-next branches
> > > of various subsystem trees and (b) branches with driver code submitted
> > > or planned for submission to maintainers into the development branch of
> > > Simon Horman's renesas.git tree.
> > >
> > > Today's version is based on renesas-devel-20181220-v4.20-rc7.
> >
> > I built this version with "gcc version 5.2.1 20151005 (Linaro GCC 5.2-2015.11-1)",
> > and then the following build error happened:
> >
> >   AS      arch/arm64/kernel/head.o
> > /home/shimoda/development/renesas/renesas-drivers/arch/arm64/kernel/head.S: Assembler messages:
> > /home/shimoda/development/renesas/renesas-drivers/arch/arm64/kernel/head.S:824: Error: missing ')'
> > /home/shimoda/development/renesas/renesas-drivers/arch/arm64/kernel/head.S:824: Error: missing ')'
> > /home/shimoda/development/renesas/renesas-drivers/arch/arm64/kernel/head.S:824: Error: missing ')'
> > /home/shimoda/development/renesas/renesas-drivers/arch/arm64/kernel/head.S:824: Error: unexpected characters following instruction at operand 2 -- `mov x2,#(2)|(2U<<(8))'
> >
> > This error seems to cause the commit 66f16a24512f ("arm64: smp: Rework early feature mismatched detection").
> > And if I modified the code as following, the build error disappeared:
> >
> > ---
> > diff --git a/arch/arm64/include/asm/smp.h b/arch/arm64/include/asm/smp.h
> > index 18955618..e9b9cee 100644
> > --- a/arch/arm64/include/asm/smp.h
> > +++ b/arch/arm64/include/asm/smp.h
> > @@ -30,7 +30,7 @@
> >  #define CPU_PANIC_KERNEL               (3)
> >
> >  #define CPU_STUCK_REASON_52_BIT_VA     (1U << CPU_STUCK_REASON_SHIFT)
> > -#define CPU_STUCK_REASON_NO_GRAN       (2U << CPU_STUCK_REASON_SHIFT)
> > +#define CPU_STUCK_REASON_NO_GRAN       (UL(2) << CPU_STUCK_REASON_SHIFT)
> >
> >  #ifndef __ASSEMBLY__
> > ---
> >
> > So, I think we have to fix this, but what do you think?
> > # I don't know why the line 812 doesn't cause the build error,
> > # but the line 824 causes the build error though...

I'm about to queue a flavour of:

http://lists.infradead.org/pipermail/linux-arm-kernel/2018-December/622858.html

to address this.

Cheers,

Will
