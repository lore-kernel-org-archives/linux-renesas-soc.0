Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792774154;
	b=pj9mM9GhyhBHh1FC2MHpDrvbKJYsT/fmks8BDOPyWHQeKqkkM7QfQxN51e/+QhB6qsg5
	 vHO77ne3zz+Sc4zwj7rDrMlBu4oSivqVxi/nGx4yfAY6v6CIeojIfQ57lTZ0PwDuikmRQ
	 MpOol5RZiWT41hon4kbyAvozcjNx1RJEDi+5pr0mr1RwNnaKdzcQmWUcS3OR2yjo2NuHg
	 k9VI2YVcZaOJfxHLaTdL6ZNHicequllM3557bwTimUwlElr2Loty3K5bEARHRkqU208gv
	 8XLRG9IoiEPqjTlPQlkpZALeaB7fEpbUuSFrjRfU+Gdl1clR7iOXagd7JaGNgCKXOhw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792774154;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=IbU6AikASsymoWZcigm5KICcvIS1yLWM5oIUuCyGJFQ=;
	b=uQvTAyDpBkxCtI8a+v6Dp4L4rcl/Uu77erWhucLDevn/Jw1lLQpEKv0T69PYNPvtceNJ
	 kTnrD71MPDdbaGE4x1UvHSVJKz9lmQpbU0CQWOqna6QCJ3a2y/r6TA3lUTIISoqfZHzhf
	 pkdq7QzCkuYhmVHEZaTEiuslkP/FQ5D/j8EGfyLitLg9Yq1T3XF02L1ISbIeA9v2ahcv8
	 KF3OTy2/GmYC5v1tNzMGLO7MeRUzDsC1nMXIt3r/PiNYz7G2+2aOk5cfpNQtJy9ZuswTC
	 ff5lusmZ8iKaMLroPs6HKB5hyGIVV5kFyFm25+JEMVg5acBG5Qav3rCSUF7mrV1hXig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=hluItQ1n;
	arc=none smtp.remote-ip=209.85.160.172
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F30DA606A31F
	for <linux-renesas-soc@vger.kernel.org>; Fri, 23 Oct 2026 16:49:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F30DA606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=hluItQ1n
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-53669f7b518so10264111cf.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 23 Oct 2026 09:49:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1792774153; x=1793378953; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=IbU6AikASsymoWZcigm5KICcvIS1yLWM5oIUuCyGJFQ=;
        b=hluItQ1n2k9be/njQlgILZYHaCMMuIM5PsLt1U3FuUAtK/8EQQNXA3YBgVfKoPHs8G
         qPfev4Rfwz0EgsFCgfINbspKj2EbpDwAKeTzuoS8AVdvMmxHJj1Vc3QYamevkDgrKAmV
         ddTMDnEMLoYWL1JwQ4zTY86poK5RD8z8ccP9w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792774153; x=1793378953;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IbU6AikASsymoWZcigm5KICcvIS1yLWM5oIUuCyGJFQ=;
        b=vZeDVsVnk13n2S/8+BN5eWvK4NbkxwNUb9vWap2TaMUqUUP1FYZS5goCUxQaZeAjIG
         ONtODSKA6mFEswNoWFdv56oeuNDIUGbFElEOXCqOJ0MpWMXz8LmNKfWphiRu/27M3SBI
         btAlXyJCLqIq/w5Kq+pUBly44sZt4mxQmcjQwjWSakVR/3h07oA0fBSrkzLU9wPF1evm
         iyL9xfMFLc9MOF6zXQ2dpAV5GsGb+/yyGo7illqOUfl8C2vCIcNCa7zQTPA3E2/WLsjE
         zPMcCUnRBe8EDWPDdaWWSdEIdEu5JhFH4sFQYQpEvS0nXZduT9RDBvko15uHBujcV8T+
         fcsQ==
X-Forwarded-Encrypted: i=1; AKwUvBwqy8ADmjZAzXqdGIL9ociN8b+GNOboHGUI0cPR9u6bE+GAXAi68tZPb7iafzY2b32kF1iinJp4a72XamlaIxK5dA==@vger.kernel.org
X-Gm-Message-State: AFq9FYJSQLyhfHEa+uhOoVEObRl1EBLIbCcYViJk3cQMHok9+9seyOib
	/5H0szkPFvRIZsjMCYZm9xWQk9/Yg1FQCVGhZZr5d6hJwGtf2SSseiSBIX64K3D3SIc2rVPDjv2
	E1Lg=
X-Gm-Gg: AYBFou3nZieLnJ0E5mXBznLUkPg+PV4Yds9fIq+NQY0ecGtn7OElRKN88S3FRDxFdhl
	eWdtmxX+NBiOj1fOp1zX0Y4aqYm68+0bY4Si4rKggYZvihb5NCMVBsPe6MLf8qZFfjBZfZ6CZZL
	8PVtpBn0Nvw1g1t4PAoWCJ4j00pp4VRIftXe4JYHRU2WNG45unwFvv80C2+aPSfHVjT4kPEB/UJ
	NBuMtVAxMqsz6JC2gcV4CuSxoocarIq/BnSRsP+v8GzC1qqTGve6oLOu2R+H6N2pq+SVmIXHNUX
	Qd2x0hNTr4Y6jRWQP6x2naPckDhGYHQVS6k6DPyVcbW2LaEVY1mIsh3YatHidgNv8RSExL3stid
	FddsROn/RjeBskSBmo55B7oVppaFO0Saa7J+9mKpjWdQ3HPnG3NGASLVEaZF6ar4qU6eaM4lYhn
	J90W3zYDxM2dJsF/xBKvV+wCVAfKz1qVxB5XugfMRB37BKQtUkH5bjuhMVbUKfod86/fJGq24Dh
	ZDpgyhJx4yfQG1bZ3dUoIR+OnFEhRCJme8rnCzW3GZfiN8Ob1G3gv/eIwIZlWqdMfQjU0f49Z+6
	CTcP2glYp7H4/O5n9pc=
X-Received: by 2002:a05:7022:4182:b0:144:fc5b:2121 with SMTP id a92af1059eb24-195c56ffe47mr4928192c88.17.1792773838113;
        Fri, 23 Oct 2026 09:43:58 -0700 (PDT)
Received: from localhost ([2a00:79e0:2e7c:8:4a1d:784c:3fc4:37a2])
        by smtp.gmail.com with UTF8SMTPSA id a92af1059eb24-197e666f0d8sm1435609c88.1.2026.10.23.09.43.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Oct 2026 09:43:57 -0700 (PDT)
Date: Fri, 23 Oct 2026 09:43:54 -0700
From: Brian Norris <briannorris@chromium.org>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Jonathan Cameron <jic23@kernel.org>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Ulf Hansson <ulfh@kernel.org>, linux-pm@vger.kernel.org,
	Andy Shevchenko <andy@kernel.org>,
	David Lechner <dlechner@baylibre.com>, linux-iio@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Rui Miguel Silva <rmfrfs@gmail.com>, linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 00/17] iio: Stop looking at
 pm_runtime_put_autosuspend() return codes
Message-ID: <atuOysdhmPRA7Waf@google.com>
References: <20261021235818.3059519-1-briannorris@chromium.org>
 <atm0umwtxZlQSAhy@ashevche-desk.local>
 <atpMNk6ymCpC5BL_@google.com>
 <atsEql7X20hGytXv@ashevche-desk.local>
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Post: <mailto:linux-renesas-soc@vger.kernel.org>
List-Help: <mailto:linux-renesas-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-renesas-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <atsEql7X20hGytXv@ashevche-desk.local>

On Fri, Oct 23, 2026 at 09:54:34AM +0300, Andy Shevchenko wrote:
> On Thu, Oct 22, 2026 at 10:47:34AM -0700, Brian Norris wrote:
> > On Thu, Oct 22, 2026 at 10:01:14AM +0300, Andy Shevchenko wrote:
> > > After three patches I stopped because it seems more works needs in each of
> > > the individual drivers. Yes, the series can be applied as is in exchange for
> > > a bigger additional churn in the future. My preference is to see everything
> > > settled down in a single step.
> > 
> > There are limits in how much work I'm willing to do on a bunch of
> > drivers I don't use, can't test, and frankly have no actual interest in.
> > I'm sure if I spent a few more minutes on each driver, I could find
> > another dozen things to try to improve.
> > 
> > I can go back to the v1 approach (fix only what I came to do) if you'd
> > prefer.
> > 
> > Or, I'd prefer to stick with the sentiment Jonathan expressed in
> > optionally requesting additional refactoring:
> > https://lore.kernel.org/all/20261018211807.66bfea0d@jic23-hlaptop/
> > that most of these changes are optional, and that fixing 1 thing is not
> > a subscription to fixing everything.
> 
> Right, but my concerns is that in (some) cases you can do one step further and
> use PM_RUNTIME_ACQUIRE*() instead of putting first the explicit calls in this
> series and makes someone to basically do the same again.

I'm not making anyone do anything except stop looking at the return code
for pm_runtime_put_autosuspend(). Those cleanup-based helpers are
totally optional, and are not always all that helpful. In fact,
sometimes they introduce more problems than they're worth.

> To me it sounds like
> a double effort. Yes, that is_active thing perhaps to much to follow, but even
> there it can be refactored to something like
> 
> 	if (is_active) {
> 		ret = regmap...
> 	} else {
> 		PM_RUNTIME_ACQUIRE*();
> 		...
> 		ret = regmap...
> 	}
> 
> without changing the driver logic.

Well, IMO, this is adding more trickiness about the scoping, precisely
because all these drivers have strange logic. Here, it may or may not be
obvious to someone that the runtime PM acquisition goes out of scope at
the end of the 'else' and so drops the refcount. Then you have to reason
about, "what does the rest of the function do?" -- hopefully nothing
relevant, but that may not always be the case.

Don't get me wrong, I think the cleanup helpers are great for many
things, and especially for well-structured code. But they're optional,
and have their own downsides and risks, especially for unfamiliar
people.

Anyway, I disagree with piling your personal desires on a submitter to
"fix" when they're unrelated, unnecessary, and may cause more work and
problems of their own (or any combination of those 3).

Brian

> Whatever, I am not a maintainer here, so if Jonathan is okay with this churn,
> then it's fine.
> 
> -- 
> With Best Regards,
> Andy Shevchenko
> 
> 
