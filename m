Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC82B388880
	for <linux-renesas-soc@vger.kernel.org>; Tue, 23 Jun 2026 17:01:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782234098; cv=none; b=RrHbBkESzskHGtr0Ba0/KIY6cOSi999YxbU6nj3TYU2m18naVyXPWbFouPj+XRx3PPPjDaYf7BpCpjr93ZX2277OhtvPG2OJt/lgXQRnTFIva42luElogcYK89YRoR0UcLFp0yISCHq4I8kpMlQmjJtqn70ipBK9POMM/AQtywg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782234098; c=relaxed/simple;
	bh=KLp47J3F3ZEmgySRH6ZoydWxIZaG/J2hxWrFEP1eRUg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=g3vqxlPjnaR0fvHsijZwLcYJVGJd0mNQF1qO0YgT7tManKiqGjtwl90YvCk6X3qT2L/CSinxNEbLxS7FSJbdJ1UfB0YnZZkRDDAq2PxwLgG1suJxBR3EEumE1g+Uf/dnb+ik7/o18kWrzczjEf0M2DF9BeDwP4IA92EPHL79mkA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=hMzk9FYD; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=hOnhKRvC; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="hMzk9FYD";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="hOnhKRvC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1782234096;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ZHLmvt/hfcPMjp8rNAR4Lzj4cVVJybJjQGa6DTmnt7A=;
	b=hMzk9FYDfcPnGfe32sS9H2Yx4dGPQaaYHtlHK34+P8rxiVuQ14ivc8YsY+ZJe4B7OGcYw3
	HsSqiid+nL/qRKxyZ80kwI9KwiN4XgT0Q/ozyL8sCy4KosVldk5X3kwl7cC+JsRh8UmRca
	VQ6JGrOLNAGwT4HFCV/+TgbTUUTo90Q=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-117-2TDKzgOzPhWhblDNJjTV0Q-1; Tue, 23 Jun 2026 13:01:35 -0400
X-MC-Unique: 2TDKzgOzPhWhblDNJjTV0Q-1
X-Mimecast-MFC-AGG-ID: 2TDKzgOzPhWhblDNJjTV0Q_1782234095
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8dde1c4da4bso2611176d6.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 23 Jun 2026 10:01:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1782234095; x=1782838895; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZHLmvt/hfcPMjp8rNAR4Lzj4cVVJybJjQGa6DTmnt7A=;
        b=hOnhKRvCr7kk7O2JbBoTiGfFNISTeEX5+riyFb7SvTnzwj3cVcUqNRyvflrubpSwmO
         LDNOjCIzz+1Y78mGQlHcymEwhFnU1rsGMfwT7xIm7fq87cp7MPKTwHywB7Ij+EeNRZIa
         dq+0GDaEMk2/X0mJwnBGYZoN+j+Dd7ZxSeN9oNLuNDvPIKSLrlZ0LB1GrZU3yPDQzzG8
         lfg9vu3YOTta25yNDZ27JnE6Guq1wRXJ/P1dLm8Y7p9lP9qhAsI4ztgfTGPn3fhFMm0t
         IUyhjI+vqqLWT2/KpIf8roSA/rIm4KM/ZqX+MjBUneE41hYojvXCIDMJP+zAuKNU5MjT
         PISg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782234095; x=1782838895;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZHLmvt/hfcPMjp8rNAR4Lzj4cVVJybJjQGa6DTmnt7A=;
        b=ktW5mZ+knL1McgHbM7uMU1gxaLBe7VF/cE3hdV6NtkHKfmSfr/W/yrGgwoY8pPMpjX
         IqOFk4VNWwyjc6BrUB5kHzA4Vmz6lOSrqyl30qEOmQVuI0nPAPQofiodSyK0jqdkjNT2
         kMlvnZcgjdJiHkSoaEjJ73n4Ne7p+mSUpKkJ3PUwmDmQWNbxK23SAEkek4rAEqfZrdAd
         NZb+aYXnAT1rfCwWQFCGQOf8fK0kOnFvPN+X+OlPAOku5HpKhHbPRVQizhcwSiit15OX
         jgpV4WbPcxhQNAiqYIqB5DD/4Y9chLj/eoyRGEdZ4IhovoSCQjAIc3HmE8rI7tTUBTjn
         +9DA==
X-Forwarded-Encrypted: i=1; AHgh+Rord4Fp4fTTAtYDwH7ELJC/sTK6ZJ16JIwad1OHKs889EuBonK4u/YjiRXQTzy02WBGHGEL91KwIABbq5jZF5SfZQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwuqPOPgARanXv8s45bYYD7xDn/54F3s+2wEHihDzrtzo84IsNt
	fWRw33M3d1OV/3Y14Jr6dtSetLeDzBnwtgBx49nwasbHXu3xBhM00ANEJtw/SdkmDDyzaQfeplo
	3T7B1puwdhb3st8fLSjnwRG+QvSLl2cbD9O6H5Vvxz43pyv5GqsBve7Dg5sTW5TusRfVbttRk
X-Gm-Gg: AfdE7cmRsZjte7PmuoHznGd6V1yZJp8VD3TJ9dup0pc9WizzO5XUHhQdlrpCJJY7/7+
	4Y4V6MqFAB5KJIVijAF+yhH0DnPxMCFMaGRbC994QfT7AHsAUZQQVTv+No9+MS0ispCmlLLT5eo
	F90HKwdSu8zfgDQD/3ZdwRcTLCw28Qj4HqCWvQ9e7Y+ybJbUTSiZyezwFyakxlHJ6PxABOHe8Mo
	B+uKnBu+8KcOOXedZMuGE5bja0V7ucHSwM+VeF/e8jZn6bn7qOMMbM57f0nQLBwbg6jSZB4ubym
	PPgX9fDDi3CEV98PhXvo2VsCNqfgjuAtpfKmYDiPGHHbZF9YmTIWy80X/ucOwAaUuSsPsfdDpW/
	s5q1pIQWxdWnjNFfKyvtbf9mqcrn2eX/0V5QVILvHBNdDQQ==
X-Received: by 2002:ad4:5c6c:0:b0:8de:7e5c:b57f with SMTP id 6a1803df08f44-8de7e5cb63emr362655746d6.4.1782234059847;
        Tue, 23 Jun 2026 10:00:59 -0700 (PDT)
X-Received: by 2002:ad4:5c6c:0:b0:8de:7e5c:b57f with SMTP id 6a1803df08f44-8de7e5cb63emr362605556d6.4.1782234033037;
        Tue, 23 Jun 2026 10:00:33 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8df7f01855bsm146771086d6.9.2026.06.23.10.00.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 10:00:32 -0700 (PDT)
Date: Tue, 23 Jun 2026 13:00:23 -0400
From: Brian Masney <bmasney@redhat.com>
To: Biju <biju.das.au@gmail.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
	Alex Helms <alexander.helms.jy@renesas.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH] dt-bindings: clock: renesas,versaclock7: Update
 maintainer
Message-ID: <ajq7pziuKDFZqj40@redhat.com>
References: <20260623162039.153291-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260623162039.153291-1-biju.das.jz@bp.renesas.com>
User-Agent: Mutt/2.3.2 (2026-04-26)

On Tue, Jun 23, 2026 at 05:20:37PM +0100, Biju wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
> 
> Alex's email is bouncing. Update the maintainers list with my contact
> details to take over the schema maintenance.
> 
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> Ref [1]
> [1] https://lore.kernel.org/all/ajqWevofEJ3fv856@redhat.com/

Reviewed-by: Brian Masney <bmasney@redhat.com>

Thanks for submitting this quickly.

Brian

