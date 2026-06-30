Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA8BA26C385;
	Tue, 30 Jun 2026 19:53:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782849201; cv=none; b=Nfh6fSXVqnS6SNDPemFJ4BLntTrH2usHdzRBeJV/eLKZ9uY2M8W/kEISw97QUWtAZOCpaIWyZhmEUtNDY3zPA+udyIxRXTWwvHE8wuFa4+Oumbd8xGuJICXTsSEhvRf/ylv65w5PjL/BkkjNsA8LwpZUafNhuvCnQNwSW5G9h0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782849201; c=relaxed/simple;
	bh=HnqJWEJPbE7A+K+Ubp1fovDjotHCc+VbQVKPZU6JeSM=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JWXMth+My+IFW6YQWe6iMJ4ichnbGx98tfYAsxlcheSwGZpVOLuRp0nGtBD+Dd+Ios9T4VVBmQSanCmxEZzkukLrBTtknRxYDQSFTuDYndjfxtQNs10LFGfFZ1AZJr/hhR0LwR+3nBkhzH8UKwMIOpMkuwuILC8T2TymfCA2Nxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=j8bysIMb; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="j8bysIMb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E8731F000E9;
	Tue, 30 Jun 2026 19:53:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782849200;
	bh=LXRxFbi1rHNU7GbafqaihoCDwM1y7YKAsLY1yaGEPbY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=j8bysIMbzvXmdKPX76RwD72APahTsxjBcVRALpKR9ix/1ivBdJD16BHUPrYRtqs9z
	 nEvIIBNBaYuhBW9hu4SYrBLt4Y5umONwcWicaQzvku6VTUEa/czI1CR55zLYCfL830
	 64FDP9ixwyz4y012ZdZoTVr0crdxDSUZG2M48yPtiJduV7gtmApxw62BKyxTKncV44
	 3+TgcmYFn66Lx6+ee5/kNbdSoG+/aIfZvQEta2d9NM5s1QAFV6hdngGSF5ATcQynMk
	 k8YVT8EPm9cU8b2pL9VI9wgcZ0JQGwGByfUtzryk2BrQNwrcJ5PfssTheyXZDhF0cJ
	 bPewcAZS2tarA==
Date: Tue, 30 Jun 2026 15:53:18 -0400
From: Steven Rostedt <rostedt@kernel.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: David Carlier <devnexen@gmail.com>, linux-kernel@vger.kernel.org, Masami
 Hiramatsu <mhiramat@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Andrew Morton
 <akpm@linux-foundation.org>, "Vineeth Pillai (Google)"
 <vineeth@bitbyteword.org>, Peter Zijlstra <peterz@infradead.org>, Linux ARM
 <linux-arm-kernel@lists.infradead.org>, Linux-Renesas
 <linux-renesas-soc@vger.kernel.org>
Subject: Re: [for-next][PATCH 04/15] tracepoint: Add lockdep
 rcu_is_watching() check to trace_##name##_enabled()
Message-ID: <20260630155318.7db20990@gandalf.local.home>
In-Reply-To: <CAMuHMdXud_RpWag_hFqa2ByBGRxg6KnxGL1ObCWZrpTsk3TfAw@mail.gmail.com>
References: <20260522143508.298439732@kernel.org>
	<20260522143525.551205135@kernel.org>
	<CAMuHMdXud_RpWag_hFqa2ByBGRxg6KnxGL1ObCWZrpTsk3TfAw@mail.gmail.com>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 30 Jun 2026 19:39:02 +0200
Geert Uytterhoeven <geert@linux-m68k.org> wrote:

> Other Renesas ARM32 platforms I tried (R-Mobile A1, RZ/A1H, RZ/A2M)
> are unafffected, perhaps because they are not SMP?
> All Renesas ARM64 platforms I tried (R-Car Gen3/4) are also unaffected.
> 
> Reverting the commit fixes the issue.
> 
> Do you have a clue?

Yes, it means the code was buggy before the commit. The commit will trigger
warnings in places that have issues. Before the commit, the buggy code was
never caught.

It's like enabling KASAN and finding code that has use-after-free.
Disabling KASAN is not the fix.

Tracepoints are managed by using RCU. There's places that RCU is turned
off, meaning a tracepoint in one of those locations can be triggered when
RCU is not active which may have a use-after-free semantic when the
tracepoint is enabled.

Tracepoints hidden by trace_#tracepoint#_enabled() are not caught when RCU
is disabled and the tracepoint is not active. This commit makes these
locations trigger even when the tracepoint is not active.

One way to find out if this is an existing bug or not, could you enable the
preemptirq tracepoints and run the tests again with the commit reverted?

  echo 1 >  /sys/kernel/tracing/events/preemptirq/enable

This will enable the events that are hidden without the commit. If it
triggers when enabled, it shows the commit found a bug.

If you get the same errors, the bug isn't with the commit in question, it's
with the tracepoints being called during suspend/resume. We will need to
fix that if that's the case.

-- Steve
