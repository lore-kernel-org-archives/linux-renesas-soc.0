Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD8684ABBAA
	for <linux-renesas-soc@vger.kernel.org>; Fri,  2 Oct 2026 14:43:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790952183; cv=none; b=NxyaTHXki0bK6BNn+75Nmk2pLU7knSZ6DCEOJY5gKQMgD6CqTl/4DSo4YZMI173JhLConTH1Aj9Mg2NYeBVr6zMQjYFsMHMO0Vpw6tsaqj+ksnVXIBcPmA3iHrffij2APJM01LLSrz/mbTuk2yAokV1iva6HnhuZmQftMjT2vkA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790952183; c=relaxed/simple;
	bh=C+g+TTLG5loMlGQvWMOxkk3GNceJUxAI/xPhBTRJyio=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZZeZBFXCcT2PxbDGdNctJvNyX8LNMqkT5iwnNrq0ehDUt3uw3rd820pm6cmLNUkzfSWm73/kmNAFiKzXaeX0BBZoiaG9aFUqF9QbpjdOHHXba+Ouhjc5C8JOp/C5wlq23NBAMqnVeKkeaIdArAG9aqrl1nX05HN+fN2Acw++8tM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=IHRVHS5B; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=XJnLZ6es; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="IHRVHS5B";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="XJnLZ6es"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790952180;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AO+wjd+TbEeTabSZ1MWHhZEnfR90lPmO8HDyBou5LhU=;
	b=IHRVHS5BuWU5BUKrP4NZsA2orQ8xwvvFs3Zv1YpoEyDg8JN0vaWHTJnb7RmslFhloAsad3
	M5tLpHrrk+6+1yugU13YB0XweKAx0ewDM3Vntf9ZHrTVpe4A3lsaH1+Rusm37cA0vU4P3v
	UZdbxMFwo8OJ8STEKA5fy83BvimZrXo=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-261-Qwa7UqnLOpKexiCRv17ALg-1; Fri, 02 Oct 2026 10:42:59 -0400
X-MC-Unique: Qwa7UqnLOpKexiCRv17ALg-1
X-Mimecast-MFC-AGG-ID: Qwa7UqnLOpKexiCRv17ALg_1790952179
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-9123c523d0cso74276d6.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 02 Oct 2026 07:42:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1790952179; x=1791556979; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:content-type:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AO+wjd+TbEeTabSZ1MWHhZEnfR90lPmO8HDyBou5LhU=;
        b=XJnLZ6esPX1aUZZExkjiNNFIw8lZupLlPtEi1rXOzlcvPW2DShrO15rGQyPGt2ADOk
         6fSKfCVJI0SxUTn9sTheN6ULpRBOcSq27rCztMOY1JHgEs9Ofl7eKZwUtiMrztLi4zu7
         cGAlzqmgiDvbTxP6Fp+X6RIoag+m8BJy5g4UkB7PIaTTZ8mEZvFl7Mi3rC9SNPHnri5k
         y6/EnVwnyhpvGlT5E+t2QI/spxUsB6IDrJDYR0wZZhcnhobOvnt//cBDm0nOo1HlKwpT
         qkkwnKfu4t+HokYIzD3/7DF23ZtJ8ExG7ZExOF3cFeSNC7YeWpdoeTO8yKTZgxMbMyvH
         R/gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790952179; x=1791556979;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:content-type:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=AO+wjd+TbEeTabSZ1MWHhZEnfR90lPmO8HDyBou5LhU=;
        b=FzcQSHmsJ4X85IhgKjouOUzRmC1JmEeD0Y+P1slXyO7/P/TfGKNVa54Ao38HKBPBVj
         0Cbx6OvDHp3JdA/jm7ROv9WvGqsSivXAKwfcTFFz+cNJUhNrk5ZdmK3QdXz7LhWvYT3f
         PnDFAnMBR8rbXe8C9tJDyncMLBrl//5qpE527u36GqYp+Ipc3MqdDLo9YPQxlp57+ZTB
         raS7fPSPycmlkYi/UW6+rga8GUIpUDVp2MSDFignAEWUMEx4juZKJ8x1CbNMGxvSMX+u
         tw3QiU9kXpbg+sWBu75CQYu+0bC1erBI5MyLNeZP6rt+AY/fFn1sCMQ4L3sZXGA5Guzl
         MoQQ==
X-Forwarded-Encrypted: i=1; AKwUvBxnVkV7iWViUDv45CcsySywl/l4CoA1FCC1Z07Y7BCJYk8X1B/4OXtUBtvvDQKOJv27z+uAH5b8L3nWNaN+oPJ4qw==@vger.kernel.org
X-Gm-Message-State: AFuF++kNLkTMJgIbXlLs965SEYpfNuP0sCVRoosZb14/zxOsv0CWqahh
	86RFSpU3hhB5eXMxmOBsOEB/8laUXQoeLjAgvVndKeefWi65n5liaQLuJMJshROUEdSfKLakP8R
	wAReiVyPNljhHsfi7TNIioxzLB+xc4fZYrWatAuWkfiCqw/N0XBFKqzduduO39X/AW+JpxpWN
X-Gm-Gg: AYBFou33G0RY0jhzQHUmpNcpdvTV04RwNg40rDo2+yxT9m8WuB9QSefyHjKAKtyH4eL
	LxcdSDX4oi9YKYfrx0wfaqK5dPVku8bxUSRJjphlhhbp0hyzg8sVeJqNQghdL8J5MJYsVt/xtGF
	JKs4mEIUgGlfn/gffPUdm4OHsobBp2km++vu28IMSkmopnFfgDxJPbZoxXt4sCauftqxzoELHpF
	PI/MrqYW/Slb9oNCUEMvVuSvfMO98t76Y/bsqerFn5xKCKvH4TkGSrhl8N3N3wJoR1agUtB7EmT
	SX5sbWFUU018+BFKxDSozN516Ae8EBm/FelUvmI+xiZK/I0K64qgb/vlM8fWkqOyl7M/NteAnmA
	XdxUlyOXatMPBQtJG+gIpNvneoaDGFM83C1A=
X-Received: by 2002:a05:6214:8587:10b0:913:ffb2:e8d9 with SMTP id 6a1803df08f44-917c01553cfmr43877026d6.40.1790952178467;
        Fri, 02 Oct 2026 07:42:58 -0700 (PDT)
X-Received: by 2002:a05:6214:8587:10b0:913:ffb2:e8d9 with SMTP id 6a1803df08f44-917c01553cfmr43876676d6.40.1790952178009;
        Fri, 02 Oct 2026 07:42:58 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-917e0b6b636sm21082406d6.26.2026.10.02.07.42.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 07:42:57 -0700 (PDT)
Date: Fri, 2 Oct 2026 10:42:56 -0400
From: Brian Masney <bmasney@redhat.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>, linux-clk@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [GIT PULL] clk: renesas: Updates for v7.4 (take two)
Message-ID: <ar_C8HD5hHsCgGl3@redhat.com>
References: <cover.1790939760.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cover.1790939760.git.geert+renesas@glider.be>
User-Agent: Mutt/2.4.2 (2026-08-30)

On Fri, Oct 02, 2026 at 01:29:05PM +0200, Geert Uytterhoeven wrote:
> 	Hi Stephen, Brian, Jérome,
> 
> The following changes since commit 8d90c0eeef104553d6b9137becd7f58b468aaa0b:
> 
>   clk: renesas: r9a09g077: Register SYSC regmap (2026-09-14 09:47:33 +0200)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git tags/renesas-clk-for-v7.4-tag2
> 
> for you to fetch changes up to 21cbd7ec29930f8e7e156e18b81736f099f03849:
> 
>   clk: renesas: r8a78000: Add SGASYNCD8_PERW_BUS (2026-09-28 13:44:05 +0200)
> 
> ----------------------------------------------------------------
> clk: renesas: Updates for v7.4 (take two)
> 
>   - Add GPU clocks on R-Car V4H,
>   - Add initial support for RZ/G2M v3.0,
>   - Add CANFD, thermal (TSU), and ADC1 clocks and resets on RZ/G3L,
>   - Add I2C parent clock support on R-Car X5H,
>   - Miscellaneous fixes and improvements.
> 
> Note that this includes DT binding definitions and updates for the
> RZ/G2M v3.0 SoC, which are shared by the clock subsystem and DT source
> files.
> 
> Thanks for pulling!

Pulled into clk-next.

Brian

