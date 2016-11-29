Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from merlin.infradead.org ([205.233.59.134]:39526 "EHLO
        merlin.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754592AbcK2Nua (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 29 Nov 2016 08:50:30 -0500
Date: Tue, 29 Nov 2016 14:50:17 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Babu Moger <babu.moger@oracle.com>, Ingo Molnar <mingo@redhat.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Kees Cook <keescook@chromium.org>,
        Dan Williams <dan.j.williams@intel.com>,
        Andrey Ryabinin <aryabinin@virtuozzo.com>,
        Tejun Heo <tj@kernel.org>, Sam Ravnborg <sam@ravnborg.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        sparclinux <sparclinux@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH v3 0/2] Ajust lockdep static allocations for sparc
Message-ID: <20161129135017.GL3092@twins.programming.kicks-ass.net>
References: <1475004808-91920-1-git-send-email-babu.moger@oracle.com>
 <CAMuHMdU13YdzoM4zTaiUvhzbgSVGeJgn6k7nyo2RayURiezK2w@mail.gmail.com>
 <20161129114103.GE3092@twins.programming.kicks-ass.net>
 <CAMuHMdWZ=1F-aL7K5YvPx58C8Cqy19fHqUGhVqVewTvXc5Z5-w@mail.gmail.com>
 <20161129122907.GH3092@twins.programming.kicks-ass.net>
 <CAMuHMdXu6vbRQrZHGG7wDojxsQpqHApwHxcFRwmwMVZYqdcfcw@mail.gmail.com>
 <20161129133141.GK3092@twins.programming.kicks-ass.net>
 <CAMuHMdW0VDJP39i510UEKy-a_aXwxWV=S2UZnNWnov4=XozWZQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdW0VDJP39i510UEKy-a_aXwxWV=S2UZnNWnov4=XozWZQ@mail.gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Tue, Nov 29, 2016 at 02:39:20PM +0100, Geert Uytterhoeven wrote:

> > Not understanding, why would a user ever need it? The platform knows if
> > its has funny boot image size limits, no?
> 
> The boot loader does not come with the kernel, so the platform cannot
> know for sure.

Why would anybody use a bootloader that imposes weird restrictions on
their platform? That is, isn't that simply a broken bootloader?
