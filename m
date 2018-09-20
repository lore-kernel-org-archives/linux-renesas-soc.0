Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mo4-p00-ob.smtp.rzone.de ([81.169.146.163]:12217 "EHLO
        mo4-p00-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731159AbeITMUJ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 20 Sep 2018 08:20:09 -0400
Date: Thu, 20 Sep 2018 08:32:02 +0200 (CEST)
From: Ulrich Hecht <uli@fpond.eu>
To: Geert Uytterhoeven <geert@linux-m68k.org>,
        Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Wolfram Sang <wsa@the-dreams.de>, linux-serial@vger.kernel.org,
        Magnus Damm <magnus.damm@gmail.com>
Message-ID: <379261410.44634.1537425122812@webmail.strato.com>
In-Reply-To: <CAMuHMdXn3ngXNFFM6Zsi2-YftvKeWnBSCxoQHd7j3xxFnBORrA@mail.gmail.com>
References: <1523638854-21804-1-git-send-email-ulrich.hecht+renesas@gmail.com>
 <CAMuHMdXn3ngXNFFM6Zsi2-YftvKeWnBSCxoQHd7j3xxFnBORrA@mail.gmail.com>
Subject: Re: [PATCH 0/2] serial: sh-sci: Use pm_runtime_get_sync()/put()
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Sorry for the delay...

> On April 13, 2018 at 7:27 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> 
> On Fri, Apr 13, 2018 at 7:00 PM, Ulrich Hecht
> <ulrich.hecht+renesas@gmail.com> wrote:
> > These patches make sure that the device is up while the suspend/resume code
> > is executed. Up-port from the BSP, tested not to break stuff.
> >
> > Hien Dang (2):
> >   serial: sh-sci: Use pm_runtime_get_sync()/put() on suspend
> >   serial: sh-sci: Use pm_runtime_get_sync()/put() on resume
> 
> I don't think it makes much sense to split this in two parts...
> 
> Furthermore, shouldn't this be handled by the serial core, calling
> uart_change_pm()?
> 
> It looks like uart_resume_port() already changes the port's state to
> enabled, while  uart_suspend_port() assumes the port is already enabled,
> and disables it.
> 
> Perhaps handling is not correct for some code paths?

The way I understand it, the problem this intends to fix is not the state the device ends up in, but that it needs to be powered while registers are read or written.

It seems to me that that the current "resume" code should work in that respect, because it changes the PM state to "on" in uart_resume_port() before any access to hardware registers takes place, so there is nothing that needs to be fixed.

That may be different for the "suspend" part, though, because it assumes that the PM state is "on", and I think that is what the patch asserts to not be a valid assumption anymore. It's hard to tell if that is true, though, because I cannot reproduce the issue here; it just works either way...

CU
Uli
