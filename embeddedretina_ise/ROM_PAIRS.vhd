----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:14:30 05/16/2014 
-- Design Name: 
-- Module Name:    ROM_PAIRS - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.RetinaParameters.ALL;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ROM_PAIRS is
	port(
		clk	:	in	std_logic;
		addr    :       in      std_logic_vector(4 downto 0);
		points1  :       out     T_POINT_INDEX;
		points2  :       out     T_POINT_INDEX
	);
end ROM_PAIRS;

architecture Behavioral of ROM_PAIRS is
	constant sROM_PAIRS : T_ROM_PAIRS :=
(
0 => (28,26), 1 => (29,25), 2 => (40,38), 3 => (32,15), 4 => (19,10), 5 => (10,7), 6 => (25,11), 7 => (42,13), 8 => (39,33), 9 => (33,15), 10 => (38,16), 11 => (21,20), 12 => (29,11), 13 => (20,15), 14 => (5,1), 15 => (33,32), 16 => (17,13), 17 => (23,12), 18 => (9,3), 19 => (25,6), 20 => (18,12), 21 => (41,37), 22 => (22,19), 23 => (4,2), 24 => (11,6), 25 => (6,0), 26 => (11,0), 27 => (38,14), 28 => (9,8), 29 => (29,6), 30 => (34,31), 31 => (16,14), 32 => (39,20), 33 => (37,29), 34 => (36,30), 35 => (40,2), 36 => (35,30), 37 => (31,22), 38 => (33,21), 39 => (32,20), 40 => (23,18), 41 => (36,35), 42 => (39,21), 43 => (28,14), 44 => (19,7), 45 => (40,16), 46 => (39,32), 47 => (8,3), 48 => (37,6), 49 => (41,25), 50 => (33,20), 51 => (40,14), 52 => (37,11), 53 => (36,24), 54 => (22,10), 55 => (41,11), 56 => (21,15), 57 => (22,7), 58 => (41,29), 59 => (13,5), 60 => (37,25), 61 => (31,19), 62 => (41,6), 63 => (38,4), 64 => (16,2), 65 => (32,21), 66 => (34,22), 67 => (38,28), 68 => (26,3), 69 => (26,14), 70 => (34,10), 71 => (31,10), 72 => (28,16), 73 => (31,7), 74 => (34,19), 75 => (28,3), 76 => (17,1), 77 => (14,2), 78 => (28,2), 79 => (26,2), 80 => (35,24), 81 => (38,26), 82 => (40,28), 83 => (21,8), 84 => (21,3), 85 => (30,24), 86 => (17,5), 87 => (40,26), 88 => (26,16), 89 => (14,4), 90 => (28,4), 91 => (34,7), 92 => (16,4), 93 => (39,9), 94 => (20,3), 95 => (39,8), 96 => (38,3), 97 => (41,23), 98 => (13,1), 99 => (20,9), 100 => (25,17), 101 => (26,4), 102 => (39,27), 103 => (20,8), 104 => (14,9), 105 => (31,1), 106 => (35,18), 107 => (13,0), 108 => (34,1), 109 => (40,3), 110 => (37,23), 111 => (17,0), 112 => (41,18), 113 => (14,3), 114 => (17,6), 115 => (18,11), 116 => (37,13), 117 => (21,9), 118 => (29,13), 119 => (27,15), 120 => (29,12), 121 => (29,17), 122 => (12,11), 123 => (13,11), 124 => (32,27), 125 => (23,6), 126 => (37,17), 127 => (25,12), 128 => (33,27), 129 => (6,5), 130 => (31,5), 131 => (37,18), 132 => (16,3), 133 => (30,23), 134 => (30,18), 135 => (41,13), 136 => (12,6), 137 => (15,8), 138 => (23,0), 139 => (15,3), 140 => (25,13), 141 => (7,4), 142 => (18,0), 143 => (36,18), 144 => (29,5), 145 => (35,12), 146 => (35,23), 147 => (16,8), 148 => (25,5), 149 => (22,1), 150 => (25,1), 151 => (13,6), 152 => (11,1), 153 => (23,11), 154 => (27,20), 155 => (10,1), 156 => (29,1), 157 => (27,9), 158 => (9,2), 159 => (14,8), 160 => (19,5), 161 => (38,7), 162 => (15,9), 163 => (34,17), 164 => (12,0), 165 => (27,21), 166 => (36,23), 167 => (16,9), 168 => (27,8), 169 => (29,18), 170 => (18,6), 171 => (41,1), 172 => (5,0), 173 => (25,23), 174 => (28,15), 175 => (3,2), 176 => (26,15), 177 => (42,30), 178 => (4,3), 179 => (40,10), 180 => (10,2), 181 => (1,0), 182 => (19,4), 183 => (26,21), 184 => (22,5), 185 => (7,5), 186 => (19,1), 187 => (17,11), 188 => (34,13), 189 => (34,0), 190 => (8,4), 191 => (24,18), 192 => (29,23), 193 => (38,21), 194 => (39,14), 195 => (28,20), 196 => (40,7), 197 => (24,12), 198 => (24,23), 199 => (39,28), 200 => (34,4), 201 => (39,26), 202 => (38,19), 203 => (39,16), 204 => (21,14), 205 => (31,0), 206 => (38,20), 207 => (32,2), 208 => (31,2), 209 => (22,4), 210 => (16,7), 211 => (40,22), 212 => (30,11), 213 => (22,2), 214 => (33,16), 215 => (31,17), 216 => (40,20), 217 => (25,18), 218 => (6,1), 219 => (33,4), 220 => (40,21), 221 => (30,6), 222 => (33,26), 223 => (19,2), 224 => (11,5), 225 => (33,2), 226 => (38,10), 227 => (31,4), 228 => (8,2), 229 => (21,2), 230 => (36,0), 231 => (42,38), 232 => (18,17), 233 => (23,13), 234 => (40,19), 235 => (13,10), 236 => (10,4), 237 => (32,16), 238 => (28,21), 239 => (7,2), 240 => (32,4), 241 => (15,2), 242 => (32,28), 243 => (13,12), 244 => (20,4), 245 => (17,7), 246 => (16,15), 247 => (20,2), 248 => (20,16), 249 => (26,20), 250 => (17,12), 251 => (12,5), 252 => (15,14), 253 => (14,10), 254 => (34,2), 255 => (42,9), 256 => (18,5), 257 => (23,1), 258 => (21,4), 259 => (24,0), 260 => (30,29), 261 => (26,7), 262 => (38,22), 263 => (19,17), 264 => (28,7), 265 => (7,3), 266 => (31,11), 267 => (9,4), 268 => (22,0), 269 => (35,25), 270 => (19,0), 271 => (23,5), 272 => (12,1), 273 => (15,4), 274 => (41,24), 275 => (22,13), 276 => (19,16), 277 => (28,10), 278 => (37,35), 279 => (37,24), 280 => (10,5), 281 => (4,1), 282 => (41,30), 283 => (31,14), 284 => (10,3), 285 => (32,26), 286 => (7,1), 287 => (18,1), 288 => (5,2), 289 => (36,29), 290 => (38,33), 291 => (36,25), 292 => (34,16), 293 => (38,34), 294 => (41,10), 295 => (40,31), 296 => (19,3), 297 => (7,0), 298 => (22,6), 299 => (26,10), 300 => (27,2), 301 => (22,3), 302 => (10,8), 303 => (23,17), 304 => (11,7), 305 => (19,11), 306 => (10,0), 307 => (19,6), 308 => (22,14), 309 => (40,32), 310 => (37,7), 311 => (27,4), 312 => (33,28), 313 => (35,17), 314 => (18,13), 315 => (20,14), 316 => (10,9), 317 => (22,17), 318 => (27,14), 319 => (21,16), 320 => (22,11), 321 => (30,17), 322 => (37,34), 323 => (37,19), 324 => (34,12), 325 => (5,4), 326 => (41,22), 327 => (31,16), 328 => (31,3), 329 => (40,1), 330 => (34,3), 331 => (29,10), 332 => (19,8), 333 => (28,27), 334 => (8,7), 335 => (40,39), 336 => (35,13), 337 => (35,29), 338 => (27,16), 339 => (14,7), 340 => (36,13), 341 => (30,13), 342 => (2,1), 343 => (30,25), 344 => (37,10), 345 => (30,5), 346 => (22,9), 347 => (16,10), 348 => (17,10), 349 => (19,13), 350 => (19,14), 351 => (29,24), 352 => (11,10), 353 => (40,27), 354 => (27,26), 355 => (13,4), 356 => (16,1), 357 => (38,5), 358 => (22,8), 359 => (25,10), 360 => (17,2), 361 => (35,1), 362 => (38,27), 363 => (34,14), 364 => (31,12), 365 => (41,31), 366 => (40,17), 367 => (22,16), 368 => (7,6), 369 => (13,7), 370 => (34,25), 371 => (25,7), 372 => (39,38), 373 => (26,1), 374 => (31,29), 375 => (41,36), 376 => (25,24), 377 => (41,7), 378 => (14,5), 379 => (39,7), 380 => (5,3), 381 => (28,19), 382 => (16,5), 383 => (37,22), 384 => (37,36), 385 => (14,1), 386 => (24,17), 387 => (38,13), 388 => (24,1), 389 => (17,4), 390 => (15,7), 391 => (3,1), 392 => (13,2), 393 => (41,35), 394 => (41,19), 395 => (2,0), 396 => (29,7), 397 => (26,22), 398 => (34,23), 399 => (31,28), 400 => (24,13), 401 => (37,30), 402 => (6,4), 403 => (39,10), 404 => (28,1), 405 => (12,10), 406 => (12,7), 407 => (15,10), 408 => (4,0), 409 => (34,29), 410 => (19,12), 411 => (38,31), 412 => (20,7), 413 => (31,18), 414 => (21,7), 415 => (26,19), 416 => (26,5), 417 => (28,22), 418 => (19,15), 419 => (22,12), 420 => (34,26), 421 => (21,10), 422 => (40,0), 423 => (20,10), 424 => (40,13), 425 => (22,15), 426 => (41,4), 427 => (9,5), 428 => (38,32), 429 => (34,18), 430 => (13,3), 431 => (38,0), 432 => (25,22), 433 => (39,19), 434 => (38,17), 435 => (17,3), 436 => (31,15), 437 => (31,25), 438 => (14,0), 439 => (40,34), 440 => (40,33), 441 => (18,10), 442 => (17,16), 443 => (31,23), 444 => (39,22), 445 => (23,10), 446 => (29,19), 447 => (29,4), 448 => (34,15), 449 => (16,0), 450 => (25,19), 451 => (37,2), 452 => (17,14), 453 => (18,7), 454 => (25,2), 455 => (31,26), 456 => (32,19), 457 => (23,7), 458 => (17,9), 459 => (29,22), 460 => (14,6), 461 => (22,20), 462 => (28,17), 463 => (23,19), 464 => (22,21), 465 => (6,3), 466 => (15,1), 467 => (27,7), 468 => (41,34), 469 => (31,20), 470 => (17,8), 471 => (33,22), 472 => (16,11), 473 => (16,13), 474 => (28,0), 475 => (12,2), 476 => (14,11), 477 => (14,13), 478 => (11,3), 479 => (27,10), 480 => (23,22), 481 => (20,19), 482 => (37,31), 483 => (34,21), 484 => (26,13), 485 => (39,1), 486 => (34,28), 487 => (26,0), 488 => (29,2), 489 => (21,19), 490 => (8,0), 491 => (25,4), 492 => (20,1), 493 => (19,18), 494 => (15,5), 495 => (16,6), 496 => (31,21), 497 => (21,1), 498 => (33,19), 499 => (33,5), 500 => (12,4), 501 => (21,5), 502 => (37,4), 503 => (22,18), 504 => (9,0), 505 => (34,20), 506 => (28,11), 507 => (35,10), 508 => (26,6), 509 => (32,22), 510 => (30,7), 511 => (41,2)
);
begin
rom: process(clk)
        variable pointIndex1: integer range 0 to 42 := 0;
        variable pointIndex2: integer range 0 to 42 := 0;
begin
if rising_edge(clk) then
	for i in 0 to 15 loop
		pointIndex1 := sROM_PAIRS(to_integer(resize(unsigned(addr)*16+i,9)))(0);
		pointIndex2 := sROM_PAIRS(to_integer(resize(unsigned(addr)*16+i,9)))(1);
		points1(i) <= std_logic_vector(to_unsigned(pointIndex1, points1(0)'length)) ;
		points2(i) <= std_logic_vector(to_unsigned(pointIndex2, points2(0)'length)) ;
	end loop;
end if;
--sROM_PAIRS(to_integer(resize(unsigned(addr)*16+i,9)))(0);
end process rom;
end Behavioral;
