Return-Path: <SRS0=84+3=PE=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 595ADC43387
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 27 Dec 2018 10:12:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 2FE2721741
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 27 Dec 2018 10:12:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730306AbeL0KMi (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Thu, 27 Dec 2018 05:12:38 -0500
Received: from mail-ua1-f49.google.com ([209.85.222.49]:35038 "EHLO
        mail-ua1-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730171AbeL0KMi (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 27 Dec 2018 05:12:38 -0500
Received: by mail-ua1-f49.google.com with SMTP id d2so5831730ual.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 27 Dec 2018 02:12:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/lscZgQkUNz0u7q5cYSYSFoH/IaHDYTbfuzQMz9DscI=;
        b=mmPdc+EXCKnN1Um4p8sUJ/LpzAJElQO1AB93QhBc2aDMdH8qGwXZ4XI7mo0ail6/SK
         rklGeJZiRVO8lpsAb753UfMzbmDTmlAHJKqOX6K6+fAq4OBLaCZfb50Nj6mAzCQy4gUa
         DCY5K6QWVb2XhJQ8+yFcMOxUc3cOqPPDT/lG6fg+GhwyoVVJPcSUpjDpnYmBs1fsyjJf
         pWL4bfAB40Idpc1LDQx+nQmOxDP8yN+KTGNGLF5FFB3CVmmrn5EUsUhuxYpuYEUCDBtE
         GhTXiIeOSf5tBK8jJGIDM8M7gxsd06Js07u7+Ixnf0zRZTP8F5QemYl0sasbp3rGGSkD
         zEVg==
X-Gm-Message-State: AJcUukfGmc3zIZiIRMPVWZKiP6k6rjordX7ShJt+LCCvJMaCHeBF7vj+
        EX7UJvaEKaITQdGuBzKSzNLw+LJbkNmPL1YiVk8=
X-Google-Smtp-Source: ALg8bN503ME82d+huMxIJ6znUP878YqfL560J+qsgQdLd5/Uk2cKDbfRKTmSvEDMiZSOL3hI0AcOdmrddJ6qmhSbn4Y=
X-Received: by 2002:ab0:216:: with SMTP id 22mr8715799uas.28.1545905557113;
 Thu, 27 Dec 2018 02:12:37 -0800 (PST)
MIME-Version: 1.0
References: <20181226110530.13136-1-geert+renesas@glider.be> <TY2PR01MB48127A0F2DCB00880576DEBCD8B60@TY2PR01MB4812.jpnprd01.prod.outlook.com>
In-Reply-To: <TY2PR01MB48127A0F2DCB00880576DEBCD8B60@TY2PR01MB4812.jpnprd01.prod.outlook.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 27 Dec 2018 11:12:25 +0100
Message-ID: <CAMuHMdXjXi1dbpk0sOf-qhzJB+uzMVYyyMVHRqv+QSCeNVVgtQ@mail.gmail.com>
Subject: Re: renesas-drivers-2018-12-26-v4.20
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Will Deacon <will.deacon@arm.com>,
        Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Shimoda-san,

Thanks for the report!

CC Will (commit author), Arnd (compiler collective).

On Thu, Dec 27, 2018 at 2:58 AM Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
> > From: Geert Uytterhoeven, Sent: Wednesday, December 26, 2018 8:06 PM
> > I have pushed renesas-drivers-2018-12-26-v4.20 to
> > https://git.kernel.org/cgit/linux/kernel/git/geert/renesas-drivers.git
> >
> > This tree is meant to ease development of platform support and drivers
> > for Renesas ARM SoCs. It is created by merging (a) the for-next branches
> > of various subsystem trees and (b) branches with driver code submitted
> > or planned for submission to maintainers into the development branch of
> > Simon Horman's renesas.git tree.
> >
> > Today's version is based on renesas-devel-20181220-v4.20-rc7.
>
> I built this version with "gcc version 5.2.1 20151005 (Linaro GCC 5.2-2015.11-1)",
> and then the following build error happened:
>
>   AS      arch/arm64/kernel/head.o
> /home/shimoda/development/renesas/renesas-drivers/arch/arm64/kernel/head.S: Assembler messages:
> /home/shimoda/development/renesas/renesas-drivers/arch/arm64/kernel/head.S:824: Error: missing ')'
> /home/shimoda/development/renesas/renesas-drivers/arch/arm64/kernel/head.S:824: Error: missing ')'
> /home/shimoda/development/renesas/renesas-drivers/arch/arm64/kernel/head.S:824: Error: missing ')'
> /home/shimoda/development/renesas/renesas-drivers/arch/arm64/kernel/head.S:824: Error: unexpected characters following instruction at operand 2 -- `mov x2,#(2)|(2U<<(8))'
>
> This error seems to cause the commit 66f16a24512f ("arm64: smp: Rework early feature mismatched detection").
> And if I modified the code as following, the build error disappeared:
>
> ---
> diff --git a/arch/arm64/include/asm/smp.h b/arch/arm64/include/asm/smp.h
> index 18955618..e9b9cee 100644
> --- a/arch/arm64/include/asm/smp.h
> +++ b/arch/arm64/include/asm/smp.h
> @@ -30,7 +30,7 @@
>  #define CPU_PANIC_KERNEL               (3)
>
>  #define CPU_STUCK_REASON_52_BIT_VA     (1U << CPU_STUCK_REASON_SHIFT)
> -#define CPU_STUCK_REASON_NO_GRAN       (2U << CPU_STUCK_REASON_SHIFT)
> +#define CPU_STUCK_REASON_NO_GRAN       (UL(2) << CPU_STUCK_REASON_SHIFT)
>
>  #ifndef __ASSEMBLY__
> ---
>
> So, I think we have to fix this, but what do you think?
> # I don't know why the line 812 doesn't cause the build error,
> # but the line 824 causes the build error though...

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
