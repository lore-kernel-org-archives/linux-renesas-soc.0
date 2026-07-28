Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 548C7355048;
	Tue, 28 Jul 2026 16:14:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785255294; cv=none; b=FwmNRCbJEBhH3xjWLzSSQLlFueuxqlnWmTlhyaMyKMwo3Ch3K2SsmUsRhlyBsXlO24c5TdkjP0L//kb/Vi4XFQbXfr5VOllL9Xhn4Vqc1axNhmSS1e1Ys0mTYh0zWw08tIXnpjRgYwpVV72lMtufRJkxBiNXmpZVTpSDFsN9ncg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785255294; c=relaxed/simple;
	bh=TpIwCN3fwwG2IGM+SH6AaUaHQ+tuRC2qvnZXgH9PHBM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jEFflrA8UEX3dalOcBXEaABRBG7/zriAJGdiIplY2yaaijeqVeDBLhvIytdsPxSJpsazmjsOQ94YRJggyizHedTIm90N7Cpkua6JIUWh7f5AXVPyPEN+txXNqjlsFcr2Bfp7KIvYZvHbuemAVF/mciPEJhqD3RJ1LuliiDEeN30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=tTvQnWPR; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="tTvQnWPR"
Received: from ideasonboard.com (93-46-82-201.ip106.fastwebnet.it [93.46.82.201])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 263642F8;
	Tue, 28 Jul 2026 18:13:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1785255224;
	bh=TpIwCN3fwwG2IGM+SH6AaUaHQ+tuRC2qvnZXgH9PHBM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tTvQnWPRn5tRQ0+LHLUOImW4GYJlYu/q9ak317nBqkHpG2vdXuDW7m0oBx/m3/V7n
	 mYqPoBZcdBDAo2Zks0XDyvygyuBiB61+7PfEiJCy+a47eqqPEhT9p0aDqADe5PyORK
	 6Tn60FtUt0HLxoDrekvTzYHYM8g9WmZ+q+p7e3pM=
Date: Tue, 28 Jul 2026 18:14:45 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@iki.fi>
Cc: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>, 
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>, Jai Luthra <jai.luthra+renesas@ideasonboard.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
Subject: Re: [PATCH v10 12/13] media: rppx1: ga: Add support for gamma out
 correction
Message-ID: <amjQiV04a5u372MU@zed>
References: <20260611204148.1423192-1-niklas.soderlund+renesas@ragnatech.se>
 <20260611204148.1423192-13-niklas.soderlund+renesas@ragnatech.se>
 <amjM5n2eYqnrpJfb@valkosipuli.retiisi.eu>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <amjM5n2eYqnrpJfb@valkosipuli.retiisi.eu>

Hi Sakari

On Tue, Jul 28, 2026 at 06:38:14PM +0300, Sakari Ailus wrote:
> Hejssan,
>
> On Thu, Jun 11, 2026 at 10:41:47PM +0200, Niklas Söderlund wrote:
> > +/**
> > + * struct rppx1_ga_params - Gamma Out Correction configuration
> > + *
> > + * The Gamma Out Correction module is available on the Human Vision Output
> > + * Pipe (HV) and the Machine Vision Output Pipe (MV). Userspace selects
> > + * which pipe to operate by setting the @header.type field to
> > + * RPPX1_PARAMS_BLOCK_TYPE_GA_HV or RPPX1_PARAMS_BLOCK_TYPE_GA_MV.
> > + *
> > + * The module allows to apply a @gamma_y gamma correction curve to RGB data
> > + * represented as a table of 16 entries. The 16 input sampling points can be
> > + * equidistant or segmented using a logarithmic scale according to the value of
> > + * @mode.
> > + *
> > + * The gamma curve values are 12 bits on the HV output pipe and 24 bits on the
> > + * MV output pipe. Userspace is expected to provide the curve values with a
> > + * bit-depth matching the one of pipe in use.
> > + *
> > + * @header: block header (type = RPPX1_PARAMS_BLOCK_TYPE_GA_HV or
> > + *	    type = RPPX1_PARAMS_BLOCK_TYPE_GA_MV)
> > + * @mode: gamma curve input segmentation mode (see rppx1_ga_seg_mode)
> > + * @gamma_y: gamma out curve y-axis values
> > + */
> > +struct rppx1_ga_params {
> > +	struct v4l2_isp_params_block_header header;
> > +	__u8 mode;
>
> Please use reserved fields to avoid holes in structs!
>

You're right.

As I've recently learned with mali, while on ARMv8 unaligned access is
not a real problem in practice, it might confuse tools and create
unecessary churn.

So yes, align whenever possible.

I've run all the types in the header though pahole and this is the
result (with the proposed fix)

The guidlines are: no holes and no implicit padding

-------------------------------------------------------------------------------
struct rppx1_window {
	__u16                      h_offs;               /*     0     2 */
	__u16                      v_offs;               /*     2     2 */
	__u16                      h_size;               /*     4     2 */
	__u16                      v_size;               /*     6     2 */

	/* size: 8, cachelines: 1, members: 4 */
	/* last cacheline: 8 bytes */
};

this one is ok
-------------------------------------------------------------------------------

-------------------------------------------------------------------------------
struct rppx1_wbmeas_params {
	struct v4l2_isp_block_header header __attribute__((__aligned__(8))); /*     0     8 */
	__u8                       mode;                 /*     8     1 */
	__u8                       ymax_cmp;             /*     9     1 */
	struct rppx1_window        wnd;                  /*    10     8 */
	__u8                       frames;               /*    18     1 */

	/* XXX 1 byte hole, try to pack */

	__u32                      ref_cr_max_r;         /*    20     4 */
	__u32                      ref_cb_max_b;         /*    24     4 */
	__u32                      min_y_max_g;          /*    28     4 */
	__u32                      max_y;                /*    32     4 */
	__u32                      max_csum;             /*    36     4 */
	__u32                      min_c;                /*    40     4 */
	__u16                      ccor_coeff[3][3];     /*    44    18 */

	/* XXX 2 bytes hole, try to pack */

	/* --- cacheline 1 boundary (64 bytes) --- */
	__u32                      ccor_offs[3];         /*    64    12 */

	/* size: 80, cachelines: 2, members: 13 */
	/* sum members: 73, holes: 2, sum holes: 3 */
	/* padding: 4 */
	/* forced alignments: 1 */
	/* last cacheline: 16 bytes */
} __attribute__((__aligned__(8)));

This one might benefit from re-arranging the first 4 members and
insert one padding byte after "frames", 2 bytes after "ccor_coeff" and
2 bytes after "ccor_offs" to avoid the compiler insert padding there

struct rppx1_wbmeas_params {
	struct v4l2_isp_block_header header __attribute__((__aligned__(8))); /*     0     8 */
	struct rppx1_window        wnd;                  /*     8     8 */
	__u8                       mode;                 /*    16     1 */
	__u8                       ymax_cmp;             /*    17     1 */
	__u8                       frames;               /*    18     1 */
	__u8                       reserved;             /*    19     1 */
	__u32                      ref_cr_max_r;         /*    20     4 */
	__u32                      ref_cb_max_b;         /*    24     4 */
	__u32                      min_y_max_g;          /*    28     4 */
	__u32                      max_y;                /*    32     4 */
	__u32                      max_csum;             /*    36     4 */
	__u32                      min_c;                /*    40     4 */
	__u16                      ccor_coeff[3][3];     /*    44    18 */
	__u16                      reserved2;            /*    62     2 */
	/* --- cacheline 1 boundary (64 bytes) --- */
	__u32                      ccor_offs[3];         /*    64    12 */
	__u32                      reserved3;            /*    76     4 */

	/* size: 80, cachelines: 2, members: 16 */
	/* forced alignments: 1 */
	/* last cacheline: 16 bytes */
} __attribute__((__aligned__(8)));
-------------------------------------------------------------------------------

-------------------------------------------------------------------------------
struct rppx1_awbg_params {
	struct v4l2_isp_block_header header __attribute__((__aligned__(8))); /*     0     8 */
	__u32                      gain_red;             /*     8     4 */
	__u32                      gain_green_r;         /*    12     4 */
	__u32                      gain_blue;            /*    16     4 */
	__u32                      gain_green_b;         /*    20     4 */

	/* size: 24, cachelines: 1, members: 5 */
	/* forced alignments: 1 */
	/* last cacheline: 24 bytes */
} __attribute__((__aligned__(8)));

this one is ok
-------------------------------------------------------------------------------

-------------------------------------------------------------------------------
struct rppx1_exm_params {
	struct v4l2_isp_block_header header __attribute__((__aligned__(8))); /*     0     8 */
	__u32                      mode;                 /*     8     4 */
	__u8                       channel_sel;          /*    12     1 */

	/* XXX 3 bytes hole, try to pack */

	__u32                      last_line;            /*    16     4 */
	struct rppx1_window        wnd;                  /*    20     8 */
	__u8                       coeff_r;              /*    28     1 */
	__u8                       coeff_g_gr;           /*    29     1 */
	__u8                       coeff_b;              /*    30     1 */
	__u8                       coeff_gb;             /*    31     1 */

	/* size: 32, cachelines: 1, members: 9 */
	/* sum members: 29, holes: 1, sum holes: 3 */
	/* forced alignments: 1 */
	/* last cacheline: 32 bytes */
} __attribute__((__aligned__(8)));

Re-arranging the first members and inserting 3 padding bytes at the
end should make things better

struct rppx1_exm_params {
	struct v4l2_isp_block_header header __attribute__((__aligned__(8))); /*     0     8 */
	struct rppx1_window        wnd;                  /*     8     8 */
	__u32                      mode;                 /*    16     4 */
	__u32                      last_line;            /*    20     4 */
	__u8                       channel_sel;          /*    24     1 */
	__u8                       coeff_r;              /*    25     1 */
	__u8                       coeff_g_gr;           /*    26     1 */
	__u8                       coeff_b;              /*    27     1 */
	__u8                       coeff_gb;             /*    28     1 */
	__u8                       reserved[3];          /*    29     3 */

	/* size: 32, cachelines: 1, members: 10 */
	/* forced alignments: 1 */
	/* last cacheline: 32 bytes */
} __attribute__((__aligned__(8)));
-------------------------------------------------------------------------------

-------------------------------------------------------------------------------
struct rppx1_hist_params {
	struct v4l2_isp_block_header header __attribute__((__aligned__(8))); /*     0     8 */
	__u8                       mode;                 /*     8     1 */
	__u8                       channel_sel;          /*     9     1 */
	struct rppx1_window        wnd;                  /*    10     8 */
	__u8                       weights[25];          /*    18    25 */

	/* XXX 1 byte hole, try to pack */

	__u32                      last_line;            /*    44     4 */
	__u32                      v_stepsize;           /*    48     4 */
	__u32                      h_step_inc;           /*    52     4 */
	__u8                       coeff[3];             /*    56     3 */

	/* XXX 1 byte hole, try to pack */

	__u32                      sample_offs;          /*    60     4 */
	/* --- cacheline 1 boundary (64 bytes) --- */
	__u8                       sample_shift;         /*    64     1 */

	/* size: 72, cachelines: 2, members: 11 */
	/* sum members: 63, holes: 2, sum holes: 2 */
	/* padding: 7 */
	/* forced alignments: 1 */
	/* last cacheline: 8 bytes */
} __attribute__((__aligned__(8)));

This requires a bit more work but could become

struct rppx1_hist_params {
	struct v4l2_isp_block_header header __attribute__((__aligned__(8))); /*     0     8 */
	struct rppx1_window        wnd;                  /*     8     8 */
	__u8                       mode;                 /*    16     1 */
	__u8                       channel_sel;          /*    17     1 */
	__u8                       weights[25];          /*    18    25 */
	__u8                       reserved;             /*    43     1 */
	__u32                      last_line;            /*    44     4 */
	__u32                      v_stepsize;           /*    48     4 */
	__u32                      h_step_inc;           /*    52     4 */
	__u8                       coeff[3];             /*    56     3 */
	__u8                       reserved2;            /*    59     1 */
	__u32                      sample_offs;          /*    60     4 */
	/* --- cacheline 1 boundary (64 bytes) --- */
	__u8                       sample_shift;         /*    64     1 */
	__u8                       reserved3[7];         /*    65     7 */

	/* size: 72, cachelines: 2, members: 14 */
	/* forced alignments: 1 */
	/* last cacheline: 8 bytes */
} __attribute__((__aligned__(8)));
-------------------------------------------------------------------------------

-------------------------------------------------------------------------------
struct rppx1_bls_fixed {
	__u32                      a;                    /*     0     4 */
	__u32                      b;                    /*     4     4 */
	__u32                      c;                    /*     8     4 */
	__u32                      d;                    /*    12     4 */

	/* size: 16, cachelines: 1, members: 4 */
	/* last cacheline: 16 bytes */
};

this one is ok
-------------------------------------------------------------------------------

-------------------------------------------------------------------------------
struct rppx1_bls_params {
	struct v4l2_isp_block_header header __attribute__((__aligned__(8))); /*     0     8 */
	__u8                       mode;                 /*     8     1 */
	__u8                       en_windows;           /*     9     1 */
	__u8                       samples;              /*    10     1 */

	/* XXX 1 byte hole, try to pack */

	struct rppx1_window        window1;              /*    12     8 */
	struct rppx1_window        window2;              /*    20     8 */
	struct rppx1_bls_fixed     fixed;                /*    28    16 */

	/* size: 48, cachelines: 1, members: 7 */
	/* sum members: 43, holes: 1, sum holes: 1 */
	/* padding: 4 */
	/* forced alignments: 1 */
	/* last cacheline: 48 bytes */
} __attribute__((__aligned__(8)));

This one needs one reserved byte and 4 padding bytes at

struct rppx1_bls_params {
	struct v4l2_isp_block_header header __attribute__((__aligned__(8))); /*     0     8 */
	__u8                       mode;                 /*     8     1 */
	__u8                       en_windows;           /*     9     1 */
	__u8                       samples;              /*    10     1 */
	__u8                       reserved;             /*    11     1 */
	struct rppx1_window        window1;              /*    12     8 */
	struct rppx1_window        window2;              /*    20     8 */
	struct rppx1_bls_fixed     fixed;                /*    28    16 */
	__u32                      reserved2;            /*    44     4 */

	/* size: 48, cachelines: 1, members: 9 */
	/* forced alignments: 1 */
	/* last cacheline: 48 bytes */
} __attribute__((__aligned__(8)));
-------------------------------------------------------------------------------

-------------------------------------------------------------------------------
struct rppx1_ccor_params {
	struct v4l2_isp_block_header header __attribute__((__aligned__(8))); /*     0     8 */
	__u16                      coeff[3][3];          /*     8    18 */

	/* XXX 2 bytes hole, try to pack */

	__u32                      offset[3];            /*    28    12 */

	/* size: 40, cachelines: 1, members: 3 */
	/* sum members: 38, holes: 1, sum holes: 2 */
	/* forced alignments: 1 */
	/* last cacheline: 40 bytes */
} __attribute__((__aligned__(8)));

2 padding bytes are enough for this

struct rppx1_ccor_params {
	struct v4l2_isp_block_header header __attribute__((__aligned__(8))); /*     0     8 */
	__u16                      coeff[3][3];          /*     8    18 */
	__u16                      reserved;             /*    26     2 */
	__u32                      offset[3];            /*    28    12 */

	/* size: 40, cachelines: 1, members: 4 */
	/* forced alignments: 1 */
	/* last cacheline: 40 bytes */
} __attribute__((__aligned__(8)));
-------------------------------------------------------------------------------

-------------------------------------------------------------------------------
struct rppx1_lsc_params {
	struct v4l2_isp_block_header header __attribute__((__aligned__(8))); /*     0     8 */
	__u16                      r_data[17][17];       /*     8   578 */
	/* --- cacheline 9 boundary (576 bytes) was 10 bytes ago --- */
	__u16                      gr_data[17][17];      /*   586   578 */
	/* --- cacheline 18 boundary (1152 bytes) was 12 bytes ago --- */
	__u16                      gb_data[17][17];      /*  1164   578 */
	/* --- cacheline 27 boundary (1728 bytes) was 14 bytes ago --- */
	__u16                      b_data[17][17];       /*  1742   578 */
	/* --- cacheline 36 boundary (2304 bytes) was 16 bytes ago --- */
	__u16                      x_grad[16];           /*  2320    32 */
	__u16                      y_grad[16];           /*  2352    32 */
	/* --- cacheline 37 boundary (2368 bytes) was 16 bytes ago --- */
	__u16                      x_sect_size[16];      /*  2384    32 */
	__u16                      y_sect_size[16];      /*  2416    32 */

	/* size: 2448, cachelines: 39, members: 9 */
	/* forced alignments: 1 */
	/* last cacheline: 16 bytes */
} __attribute__((__aligned__(8)));

this one is ok
-------------------------------------------------------------------------------

-------------------------------------------------------------------------------
struct rppx1_ga_params {
	struct v4l2_isp_block_header header __attribute__((__aligned__(8))); /*     0     8 */
	__u8                       mode;                 /*     8     1 */

	/* XXX 3 bytes hole, try to pack */

	__u32                      gamma_y[17];          /*    12    68 */

	/* size: 80, cachelines: 2, members: 3 */
	/* sum members: 77, holes: 1, sum holes: 3 */
	/* forced alignments: 1 */
	/* last cacheline: 16 bytes */
} __attribute__((__aligned__(8)));

3 padding bytes for this one

struct rppx1_ga_params {
	struct v4l2_isp_block_header header __attribute__((__aligned__(8))); /*     0     8 */
	__u8                       mode;                 /*     8     1 */
	__u8                       reserved[3];          /*     9     3 */
	__u32                      gamma_y[17];          /*    12    68 */

	/* size: 80, cachelines: 2, members: 4 */
	/* forced alignments: 1 */
	/* last cacheline: 16 bytes */
} __attribute__((__aligned__(8)));
-------------------------------------------------------------------------------

-------------------------------------------------------------------------------
struct rppx1_lin_params {
	struct v4l2_isp_block_header header __attribute__((__aligned__(8))); /*     0     8 */
	__u32                      curve_r[17];          /*     8    68 */
	/* --- cacheline 1 boundary (64 bytes) was 12 bytes ago --- */
	__u32                      curve_g[17];          /*    76    68 */
	/* --- cacheline 2 boundary (128 bytes) was 16 bytes ago --- */
	__u32                      curve_b[17];          /*   144    68 */
	/* --- cacheline 3 boundary (192 bytes) was 20 bytes ago --- */
	__u8                       dx[16];               /*   212    16 */

	/* size: 232, cachelines: 4, members: 5 */
	/* padding: 4 */
	/* forced alignments: 1 */
	/* last cacheline: 40 bytes */
} __attribute__((__aligned__(8)));

Just 4 padding bytes at the end

struct rppx1_lin_params {
	struct v4l2_isp_block_header header __attribute__((__aligned__(8))); /*     0     8 */
	__u32                      curve_r[17];          /*     8    68 */
	/* --- cacheline 1 boundary (64 bytes) was 12 bytes ago --- */
	__u32                      curve_g[17];          /*    76    68 */
	/* --- cacheline 2 boundary (128 bytes) was 16 bytes ago --- */
	__u32                      curve_b[17];          /*   144    68 */
	/* --- cacheline 3 boundary (192 bytes) was 20 bytes ago --- */
	__u8                       dx[16];               /*   212    16 */
	__u32                      reserved;             /*   228     4 */

	/* size: 232, cachelines: 4, members: 6 */
	/* forced alignments: 1 */
	/* last cacheline: 40 bytes */
} __attribute__((__aligned__(8)));
-------------------------------------------------------------------------------

-------------------------------------------------------------------------------
struct rppx1_wbmeas_stats {
	struct v4l2_isp_block_header header __attribute__((__aligned__(8))); /*     0     8 */
	__u32                      cnt;                  /*     8     4 */
	__u32                      mean_y_or_g;          /*    12     4 */
	__u32                      mean_cb_or_b;         /*    16     4 */
	__u32                      mean_cr_or_r;         /*    20     4 */

	/* size: 24, cachelines: 1, members: 5 */
	/* forced alignments: 1 */
	/* last cacheline: 24 bytes */
} __attribute__((__aligned__(8)));

This one is ok
-------------------------------------------------------------------------------

-------------------------------------------------------------------------------
struct rppx1_exm_stats {
	struct v4l2_isp_block_header header __attribute__((__aligned__(8))); /*     0     8 */
	__u32                      exp_mean[25];         /*     8   100 */

	/* size: 112, cachelines: 2, members: 2 */
	/* padding: 4 */
	/* forced alignments: 1 */
	/* last cacheline: 48 bytes */
} __attribute__((__aligned__(8)));

4 padding bytes at the end

struct rppx1_exm_stats {
	struct v4l2_isp_block_header header __attribute__((__aligned__(8))); /*     0     8 */
	__u32                      exp_mean[25];         /*     8   100 */
	/* --- cacheline 1 boundary (64 bytes) was 44 bytes ago --- */
	__u32                      reserved;             /*   108     4 */

	/* size: 112, cachelines: 2, members: 3 */
	/* forced alignments: 1 */
	/* last cacheline: 48 bytes */
} __attribute__((__aligned__(8)));
-------------------------------------------------------------------------------

-------------------------------------------------------------------------------
struct rppx1_hist_stats {
	struct v4l2_isp_block_header header __attribute__((__aligned__(8))); /*     0     8 */
	__u32                      hist_bins[32];        /*     8   128 */

	/* size: 136, cachelines: 3, members: 2 */
	/* forced alignments: 1 */
	/* last cacheline: 8 bytes */
} __attribute__((__aligned__(8)));

this one is ok
-------------------------------------------------------------------------------

I can follow up quickly with a patch, it would be bad to miss this
merge window!


> > +	__u32 gamma_y[RPPX1_GA_MAX_SAMPLES];
> > +};
> > +
> >  /**
> >   * RPPX1_PARAMS_MAX_SIZE - Maximum size of all RPP-X1 parameter blocks
> >   *
> > @@ -516,7 +565,9 @@ struct rppx1_lsc_params {
> >  	sizeof(struct rppx1_bls_params)				+	\
> >  	sizeof(struct rppx1_ccor_params)			+	\
> >  	sizeof(struct rppx1_lsc_params)				+	\
> > -	sizeof(struct rppx1_lsc_params))
> > +	sizeof(struct rppx1_lsc_params)				+	\
> > +	sizeof(struct rppx1_ga_params)				+	\
> > +	sizeof(struct rppx1_ga_params))
> >
> >  /* ---------------------------------------------------------------------------
> >   * Statistics Structures
>
> --
> Regards,
>
> Sakari Ailus
