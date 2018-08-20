Return-Path: <u-boot-bounces@lists.denx.de>
Date: Mon, 20 Aug 2018 15:42:38 +0200
From: Eugeniu Rosca <erosca@de.adit-jv.com>
To: Marek Vasut <marek.vasut@gmail.com>
Message-ID: <20180820134238.GA11891@vmlxhi-102.adit-jv.com>
References: <20180820000033.25519-1-erosca@de.adit-jv.com>
 <20180820000033.25519-5-erosca@de.adit-jv.com>
 <a2ccb9b2-0a8e-29ef-269a-3c110752a7c6@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <a2ccb9b2-0a8e-29ef-269a-3c110752a7c6@gmail.com>
Cc: Baruch Siach <baruch@tkos.co.il>,
 Alexey Brodkin <Alexey.Brodkin@synopsys.com>,
 Pantelis Antoniou <pantelis.antoniou@konsulko.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Chris Packham <judge.packham@gmail.com>,
 Marek Vasut <marek.vasut+renesas@gmail.com>, Tom Rini <trini@konsulko.com>,
 Takeshi Kihara <takeshi.kihara.df@renesas.com>,
 Stephen Warren <swarren@nvidia.com>, u-boot@lists.denx.de,
 Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Michal Simek <michal.simek@xilinx.com>, Stefan Roese <sr@denx.de>,
 Eugeniu Rosca <roscaeugeniu@gmail.com>,
 Andre Przywara <andre.przywara@arm.com>,
 Andrey Ryabinin <aryabinin@virtuozzo.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Alexander Graf <agraf@suse.de>, Joe Hershberger <joe.hershberger@ni.com>,
 Eugeniu Rosca <erosca@de.adit-jv.com>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Andy Yan <andy.yan@rock-chips.com>
Subject: Re: [U-Boot] [PATCH 4/8] pinctrl: renesas: Fix "left shift in type
 int" undefined behavior
List-Unsubscribe: <https://lists.denx.de/options/u-boot>,
 <mailto:u-boot-request@lists.denx.de?subject=unsubscribe>
List-Archive: <http://lists.denx.de/pipermail/u-boot/>
List-Post: <mailto:u-boot@lists.denx.de>
List-Help: <mailto:u-boot-request@lists.denx.de?subject=help>
List-Subscribe: <https://lists.denx.de/listinfo/u-boot>,
 <mailto:u-boot-request@lists.denx.de?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: u-boot-bounces@lists.denx.de
Sender: "U-Boot" <u-boot-bounces@lists.denx.de>
List-ID: <linux-renesas-soc.vger.kernel.org>

SGkgTWFyZWssCgpPbiBNb24sIEF1ZyAyMCwgMjAxOCBhdCAxMDowNzoxNkFNICswMjAwLCBNYXJl
ayBWYXN1dCB3cm90ZToKPiBPbiAwOC8yMC8yMDE4IDAyOjAwIEFNLCBFdWdlbml1IFJvc2NhIHdy
b3RlOgo+ID4gQm9vdGluZyBSLUNhciBIMy1TYWx2YXRvci1YIChDT05GSUdfVUJTQU49eSkgY29u
c2lzdGVudGx5IHJlc3VsdHMgaW46Cj4gPiAKPiA+ID09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PQo+ID4gVUJTQU46IFVu
ZGVmaW5lZCBiZWhhdmlvdXIgaW4gZHJpdmVycy9waW5jdHJsL3JlbmVzYXMvcGZjLmM6NDAyOjQw
Cj4gPiBsZWZ0IHNoaWZ0IG9mIDEgYnkgMzEgcGxhY2VzIGNhbm5vdCBiZSByZXByZXNlbnRlZCBp
biB0eXBlICdpbnQnCj4gPiA9PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT0KPiA+ID09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PQo+ID4gVUJTQU46
IFVuZGVmaW5lZCBiZWhhdmlvdXIgaW4gZHJpdmVycy9waW5jdHJsL3JlbmVzYXMvcGZjLmM6NDEw
OjM5Cj4gPiBsZWZ0IHNoaWZ0IG9mIDEgYnkgMzEgcGxhY2VzIGNhbm5vdCBiZSByZXByZXNlbnRl
ZCBpbiB0eXBlICdpbnQnCj4gPiA9PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT0KPiA+IAo+ID4gV2hpbGUgZml4aW5nIHRo
ZXNlIHdhcm5pbmdzLCBjb252ZXJ0ICphbGwqIFNIX1BGQ19QSU5fQ0ZHXyogZGVmaW5pdGlvbnMK
PiA+IHRvIHVzZSB0aGUgcmVjb21tZW5kZWQgQklUKCkgbWFjcm8uCj4gPiAKPiA+IEZpeGVzOiA5
MTBkZjRkMDdlMzcgKCJwaW5jdHJsOiBybW9iaWxlOiBBZGQgUmVuZXNhcyBSQ2FyIHBpbmNvbnRy
b2wgZHJpdmVyIikKPiA+IFNpZ25lZC1vZmYtYnk6IEV1Z2VuaXUgUm9zY2EgPGVyb3NjYUBkZS5h
ZGl0LWp2LmNvbT4KPiA+IC0tLQo+ID4gIGRyaXZlcnMvcGluY3RybC9yZW5lc2FzL3NoX3BmYy5o
IHwgMTQgKysrKysrKy0tLS0tLS0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCsp
LCA3IGRlbGV0aW9ucygtKQo+ID4gCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9waW5jdHJsL3Jl
bmVzYXMvc2hfcGZjLmggYi9kcml2ZXJzL3BpbmN0cmwvcmVuZXNhcy9zaF9wZmMuaAo+ID4gaW5k
ZXggYjk4YzJmMTg1ZDI2Li5iNThlNTJiYmZiYjkgMTAwNjQ0Cj4gPiAtLS0gYS9kcml2ZXJzL3Bp
bmN0cmwvcmVuZXNhcy9zaF9wZmMuaAo+ID4gKysrIGIvZHJpdmVycy9waW5jdHJsL3JlbmVzYXMv
c2hfcGZjLmgKPiA+IEBAIC0yMSwxMyArMjEsMTMgQEAgZW51bSB7Cj4gPiAgCVBJTk1VWF9UWVBF
X0lOUFVULAo+ID4gIH07Cj4gPiAgCj4gPiAtI2RlZmluZSBTSF9QRkNfUElOX0NGR19JTlBVVAkJ
KDEgPDwgMCkKPiA+IC0jZGVmaW5lIFNIX1BGQ19QSU5fQ0ZHX09VVFBVVAkJKDEgPDwgMSkKPiA+
IC0jZGVmaW5lIFNIX1BGQ19QSU5fQ0ZHX1BVTExfVVAJCSgxIDw8IDIpCj4gPiAtI2RlZmluZSBT
SF9QRkNfUElOX0NGR19QVUxMX0RPV04JKDEgPDwgMykKPiA+IC0jZGVmaW5lIFNIX1BGQ19QSU5f
Q0ZHX0lPX1ZPTFRBR0UJKDEgPDwgNCkKPiA+IC0jZGVmaW5lIFNIX1BGQ19QSU5fQ0ZHX0RSSVZF
X1NUUkVOR1RICSgxIDw8IDUpCj4gPiAtI2RlZmluZSBTSF9QRkNfUElOX0NGR19OT19HUElPCQko
MSA8PCAzMSkKPiA+ICsjZGVmaW5lIFNIX1BGQ19QSU5fQ0ZHX0lOUFVUCQlCSVQoMCkKPiA+ICsj
ZGVmaW5lIFNIX1BGQ19QSU5fQ0ZHX09VVFBVVAkJQklUKDEpCj4gPiArI2RlZmluZSBTSF9QRkNf
UElOX0NGR19QVUxMX1VQCQlCSVQoMikKPiA+ICsjZGVmaW5lIFNIX1BGQ19QSU5fQ0ZHX1BVTExf
RE9XTglCSVQoMykKPiA+ICsjZGVmaW5lIFNIX1BGQ19QSU5fQ0ZHX0lPX1ZPTFRBR0UJQklUKDQp
Cj4gPiArI2RlZmluZSBTSF9QRkNfUElOX0NGR19EUklWRV9TVFJFTkdUSAlCSVQoNSkKPiA+ICsj
ZGVmaW5lIFNIX1BGQ19QSU5fQ0ZHX05PX0dQSU8JCUJJVCgzMSkKPiAKPiBNaWdodCBtYWtlIHNl
bnNlIHRvIGFwcGx5IHRoZSBzYW1lIGZpeCBmb3IgTGludXggPwoKT2RkbHkgZW5vdWdoLCBVQlNB
TiBkb2Vzbid0IGNvbXBsYWluIGFib3V0IHRob3NlIHNoaWZ0cyBpbiB0aGUga2VybmVsLgpJIGNh
biBvbmx5IGd1ZXNzIGZvciB0aGUgbW9tZW50IHdoeSB0aGlzIGRpZmZlcmVuY2UuCgo+IAo+IEFj
a2VkLWJ5OiBNYXJlayBWYXN1dCA8bWFyZWsudmFzdXRAZ21haWwuY29tPgo+IAo+IC0tIAo+IEJl
c3QgcmVnYXJkcywKPiBNYXJlayBWYXN1dAoKQmVzdCByZWdhcmRzLApFdWdlbml1LgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpVLUJvb3QgbWFpbGluZyBs
aXN0ClUtQm9vdEBsaXN0cy5kZW54LmRlCmh0dHBzOi8vbGlzdHMuZGVueC5kZS9saXN0aW5mby91
LWJvb3QK
